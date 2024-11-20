import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/data/models/dto/Request/register_dto.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegisterEvent extends AuthEvent {
  final RegisterDto registerDto;

  const AuthRegisterEvent({required this.registerDto});

  @override
  List<Object> get props => [
        registerDto.name,
        registerDto.email,
        registerDto.username,
        registerDto.password
      ];
}

class AuthLoginEvent extends AuthEvent {
  final LoginDto loginDto;
  // final String username;
  // final String password;

  const AuthLoginEvent({required this.loginDto});

  @override
  List<Object> get props => [loginDto.username, loginDto.password];
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();

  @override
  List<Object> get props => [];
}
