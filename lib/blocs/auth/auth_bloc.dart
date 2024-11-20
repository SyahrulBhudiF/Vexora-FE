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
          username: event.registerDto.username,
          email: event.registerDto.email,
          name: event.registerDto.name,
          password: event.registerDto.password,
        ));
        _logger.info("Response: $response");
        response.fold(
          (l) => emit(AuthFailure(message: l)),
          (r) => emit(AuthSuccess(user: r)),
        );
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
          username: event.loginDto.username,
          password: event.loginDto.password,
        ));
        _logger.info("Response: $response");
        response.fold(
          (l) => emit(AuthFailure(message: l)),
          (r) => emit(AuthSuccess(user: r)),
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(AuthFailure(message: e.toString()));
      }
    });

    on<AuthLogoutEvent>((event, emit) async {
      _logger.info("Logout event: $event");
      emit(AuthLoading());
      try {
        final response = await authController.logout();
        _logger.info("Response: $response");
        response.fold(
          (l) => emit(AuthFailure(message: l)),
          (r) => emit(const AuthLogoutSuccess()),
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
