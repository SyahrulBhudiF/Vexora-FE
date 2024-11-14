import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/controller/auth_controller.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/data/models/dto/Request/register_dto.dart';
import 'package:vexora_fe/blocs/auth/auth_event.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import 'package:logging/logging.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController authController;
  final Logger _logger = Logger('AuthBloc');

  AuthBloc({required this.authController}) : super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      _logger.info("Register event: $event");
      emit(AuthLoading());
      try {
        _logger.info("Start register");
        final response = await authController.register(RegisterDto(
          username: event.username,
          email: event.email,
          name: event.name,
          password: event.password,
        ));
        _logger.info("Response: $response");
        emit(const AuthSuccess(message: "User registered successfully"));
      } catch (e) {
        _logger.severe("Error: $e");
        emit(AuthFailure(message: e.toString()));
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      _logger.info("Login event: $event");
      emit(AuthLoading());
      try {
        final response = await authController.login(LoginDto(
          username: event.username,
          password: event.password,
        ));
        _logger.info("Response: $response");
        emit(const AuthSuccess(message: "Login successful"));
      } catch (e) {
        _logger.severe("Error: $e");
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
