import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/data/models/dto/Request/register_dto.dart';

import '../../data/models/dto/Request/verifyOtp_dto.dart';

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

  const AuthLoginEvent({required this.loginDto});

  @override
  List<Object> get props => [loginDto.username, loginDto.password];
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();

  @override
  List<Object> get props => [];
}

class AuthSendOtpEvent extends AuthEvent {
  final String email;

  const AuthSendOtpEvent(this.email);

  @override
  List<Object> get props => [email];
}

class AuthVerifyOtpEvent extends AuthEvent {
  final VerifyOtpDto verifyOtpDto;

  const AuthVerifyOtpEvent({required this.verifyOtpDto});

  @override
  List<Object> get props => [verifyOtpDto.email, verifyOtpDto.otp];
}
