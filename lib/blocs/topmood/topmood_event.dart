import 'package:equatable/equatable.dart';

abstract class MostMoodEvent extends Equatable {
  const MostMoodEvent();
  @override
  List<Object?> get props => [];
}

class GetMostMoodEvent extends MostMoodEvent {}
