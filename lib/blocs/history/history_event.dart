import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  List<Object> get props => [];
}

class HistoryGetEvent extends HistoryEvent {
  const HistoryGetEvent();
}
