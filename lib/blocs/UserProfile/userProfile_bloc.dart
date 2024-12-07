import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';
import 'package:vexora_fe/data/models/dto/Request/userProfileUpdate_dto.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_event.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_state.dart';
import 'package:logging/logging.dart';

import '../../controller/userProfile_controller.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileController userProfileController;
  final Logger _logger = Logger('UserProfileBloc');

  UserProfileBloc({required this.userProfileController}) : super(UserProfileInitial()) {
    on<FetchUserProfile>(_onFetchUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<UpdateUserProfilePicture>(_onUpdateUserProfilePicture);
  }

  Future<void> _onFetchUserProfile(FetchUserProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());
    final result = await userProfileController.user();
    result.fold(
      (failure) {
        _logger.severe("Error: $failure");
        emit(UserProfileError(message: failure));
      },
      (user) {
        emit(UserProfileLoaded(user: user));
      },
    );
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfile event, Emitter<UserProfileState> emit) async {
    User _user = User();

    if (state is UserProfileLoaded) {
      // Jika sebelumnya sudah dimuat, ambil data user yang ada
      _user = (state as UserProfileLoaded).user;
    }

    emit(UserProfileUpdating());
    final result = await userProfileController.updateProfile(event.userProfileUpdateDto);

    result.fold(
      (failure) {
        _logger.severe("Error: $failure");
        emit(UserProfileUpdateError(message: failure));
      },
      (user) {
        _user.username = event.userProfileUpdateDto.username;
        _user.name = event.userProfileUpdateDto.name;
        emit(UserProfileLoaded(user: _user));
      },
    );
  }

  Future<void> _onUpdateUserProfilePicture(UpdateUserProfilePicture event, Emitter<UserProfileState> emit) async {
    User _user = User();

    if (state is UserProfileLoaded) {
      // Jika sebelumnya sudah dimuat, ambil data user yang ada
      _user = (state as UserProfileLoaded).user;
    }

    emit(UserProfileUpdating());
    final result = await userProfileController.updateProfilePicture(event.profilePicture);

    result.fold(
      (failure) {
        _logger.severe("Error: $failure");
        emit(UserProfileUpdateError(message: failure));
      },
      (success) async {
        // Fetch the latest user data after updating the profile picture
        final userResult = await userProfileController.user();
        userResult.fold(
          (failure) {
            _logger.severe("Error: $failure");
            emit(UserProfileUpdateError(message: failure));
          },
          (user) {
            emit(UserProfileLoaded(user: user));
          },
        );
      },
    );
  }
}