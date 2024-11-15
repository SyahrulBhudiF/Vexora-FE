import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String username;
  final String password;

  const AuthRegisterEvent({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, username, password];
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  const AuthLoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
