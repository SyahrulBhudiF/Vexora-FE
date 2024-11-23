import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/blocs/password/password_event.dart';
import 'package:vexora_fe/blocs/password/password_state.dart';
import 'package:vexora_fe/controller/change_password_controller.dart';
import 'package:logging/logging.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final ChangePasswordController passwordController;
  final Logger _logger = Logger('PasswordBloc');

  PasswordBloc({required this.passwordController}) : super(PasswordInitial()) {
    // Event handler for password change
    on<ChangePasswordEvent>(_onChangePassword);
  }

  /// Handles the ChangePassword event.
  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    _logger.info("ChangePassword event: $event");
    emit(PasswordLoading());
    try {
      // Send the change password request through the controller
      final response = await passwordController.changePassword(event.changePasswordDto);

      response.fold(
      //   (l) => emit(PasswordFailure(message: l)),
      //   (r) => emit(PasswordSuccess(user: r)),
      // );
        (failure) {
          _logger.warning("Password change failed: $failure");
          emit(PasswordFailure(message: failure));
        },
        (successMessage) {
          _logger.info("Password change success: $successMessage");
          emit(PasswordSuccess(message: successMessage)); // Adjust success payload if needed.
        },
      );
    } catch (e) {
      _logger.severe("Error during password change: $e");
      emit(PasswordFailure(message: e.toString()));
    }
  }
}
