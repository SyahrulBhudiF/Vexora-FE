import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/History/history_model.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<History> history;

  const HistorySuccess({required this.history});

  @override
  List<Object> get props => [history];
}

class HistoryFailure extends HistoryState {
  final String message;

  const HistoryFailure({required this.message});

  @override
  List<Object> get props => [message];
}
