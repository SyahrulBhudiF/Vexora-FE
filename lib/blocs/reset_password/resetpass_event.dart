  import 'package:equatable/equatable.dart';

  import '../../data/models/dto/Request/resetpass_dto.dart';

  abstract class ResetPasswordEvent extends Equatable {
    const ResetPasswordEvent();

    @override
    List<Object> get props => [];
  }

  class ResetPasswordRequested extends ResetPasswordEvent {
    final ResetPasswordDto resetPasswordDto;

    const ResetPasswordRequested({required this.resetPasswordDto});

    @override
    List<Object> get props => [resetPasswordDto];
  }