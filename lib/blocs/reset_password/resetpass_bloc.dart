import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:vexora_fe/blocs/reset_password/resetpass_event.dart';
import 'package:vexora_fe/blocs/reset_password/resetpass_state.dart';
import 'package:vexora_fe/controller/resetpass_controller.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordController resetpasswordController;
  final Logger _logger = Logger('ResetPasswordBloc');

  ResetPasswordBloc({required this.resetpasswordController})
      : super(ResetPasswordInitial()) {
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<ResetPasswordState> emit,
  ) async {
    _logger.info("ResetPasswordRequested event: $event");
    emit(ResetPasswordLoading());
    try {
      final response =
          await resetpasswordController.resetPassword(event.resetPasswordDto);
      response.fold(
        (failure) {
          _logger.warning("Password reset failed: $failure");
          emit(ResetPasswordFailure(message: failure));
        },
        (successMessage) {
          _logger.info("Password reset success: $successMessage");
          emit(ResetPasswordSuccess(message: successMessage));
        },
      );
    } catch (e) {
      _logger.severe("Error during password reset: $e");
      emit(ResetPasswordFailure(message: e.toString()));
    }
  }
}
