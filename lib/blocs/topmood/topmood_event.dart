import 'package:equatable/equatable.dart';

abstract class MostMoodEvent extends Equatable {
  const MostMoodEvent();
  @override
  List<Object?> get props => [];
}

class GetMostMoodEvent extends MostMoodEvent {
  final String userId;

  GetMostMoodEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
