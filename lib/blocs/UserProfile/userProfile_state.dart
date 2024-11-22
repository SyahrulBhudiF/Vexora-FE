import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final User user;

  const UserProfileLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserProfileError extends UserProfileState {
  final String message;

  const UserProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

class UserProfileUpdating extends UserProfileState {}

class UserProfileUpdated extends UserProfileState {
  final User user;

  const UserProfileUpdated({required this.user});

  @override
  List<Object> get props => [user];
}

class UserProfileUpdateError extends UserProfileState {
  final String message;

  const UserProfileUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}
