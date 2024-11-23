import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';

/// Abstract class for all password-related events.
abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

/// Event triggered when a request to change password is made.
class ChangePasswordEvent extends PasswordEvent {
  final ChangePasswordDto changePasswordDto;

  const ChangePasswordEvent({required this.changePasswordDto});

  @override
  List<Object> get props => [
        changePasswordDto.current_password,
        changePasswordDto.new_password,
      ];
}
