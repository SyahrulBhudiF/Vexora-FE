import 'package:equatable/equatable.dart';

abstract class MostMoodState extends Equatable {
  const MostMoodState();
  @override
  List<Object?> get props => [];
}

class MostMoodInitial extends MostMoodState {}

class MostMoodLoading extends MostMoodState {}

class MostMoodSuccess extends MostMoodState {
  final String mood;

  MostMoodSuccess({required this.mood});

  @override
  List<Object?> get props => [mood];
}

class MostMoodFailure extends MostMoodState {
  final String message;

  MostMoodFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
