import 'package:equatable/equatable.dart';

import '../../data/models/dto/Request/change_password_dto.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordLoading extends PasswordState {}

class PasswordSuccess extends PasswordState {
  final ChangePasswordDto changePasswordDto;
  const PasswordSuccess({required this.changePasswordDto});

  @override
  List<Object> get props => [changePasswordDto];
}

class PasswordFailure extends PasswordState {
  final String message;

  const PasswordFailure({required this.message});

  @override
  List<Object> get props => [message];
}
