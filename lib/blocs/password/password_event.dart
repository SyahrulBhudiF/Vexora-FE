import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordEvent extends PasswordEvent {
  final ChangePasswordDto changePasswordDto;

  const ChangePasswordEvent({required this.changePasswordDto});

  @override
  List<Object> get props => [
        changePasswordDto.previous_password,
        changePasswordDto.new_password,
      ];
}
