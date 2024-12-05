import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:vexora_fe/controller/userProfile_controller.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';

// Import event dan state
import 'userProfile_event.dart';
import 'userProfile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileController userProfileController;
  final Logger _logger = Logger('UserProfileBloc');

  UserProfileBloc({required this.userProfileController})
      : super(UserProfileInitial()) {
    on<FetchUserProfile>(_onFetchUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<UpdateUserProfilePicture>(_onUpdateUserProfilePicture);
  }

  void _onFetchUserProfile(
      FetchUserProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());
    final Either<String, User> result = await userProfileController.user();

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

  void _onUpdateUserProfile(
      UpdateUserProfile event, Emitter<UserProfileState> emit) async {
    User _user = User();

    if (state is UserProfileLoaded) {
      // Jika sebelumnya   sudah dimuat, ambil data user yang ada
      _user = (state as UserProfileLoaded).user;
    }

    emit(UserProfileUpdating());
    final result =
        await userProfileController.updateProfile(event.userProfileUpdateDto);

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

  void _onUpdateUserProfilePicture(
      UpdateUserProfilePicture event, Emitter<UserProfileState> emit) async {
    emit(UserProfileUpdating());
    final Either<String, User> result =
        await userProfileController.updateProfilePicture(event.profilePicture);

    result.fold(
      (failure) {
        _logger.severe("Error: $failure");
        emit(UserProfileUpdateError(message: failure));
      },
      (user) {
        emit(UserProfileLoaded(user: user));
      },
    );
  }
}