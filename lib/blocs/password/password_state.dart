import 'package:equatable/equatable.dart';
// import 'package:vexora_fe/data/models/User/user_model.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordLoading extends PasswordState {}

class PasswordSuccess extends PasswordState {
  final String message;

  const PasswordSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class PasswordFailure extends PasswordState {
  final String message;

  const PasswordFailure({required this.message});

  @override
  List<Object> get props => [message];
}
