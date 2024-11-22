import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/User/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthLogoutSuccess extends AuthState {
  const AuthLogoutSuccess();

  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthOtpSent extends AuthState {
  const AuthOtpSent();

  @override
  List<Object> get props => [];
}

class AuthOtpVerified extends AuthState {
  const AuthOtpVerified();

  @override
  List<Object> get props => [];
}
