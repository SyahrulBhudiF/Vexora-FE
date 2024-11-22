import 'package:equatable/equatable.dart';

import '../../data/models/dto/Request/userProfileUpdate_dto.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchUserProfile extends UserProfileEvent {}

class UpdateUserProfile extends UserProfileEvent {
  final UserUpdateRequestDto userProfileUpdateDto;

  const UpdateUserProfile({required this.userProfileUpdateDto});

  @override
  List<Object> get props => [userProfileUpdateDto];
}
