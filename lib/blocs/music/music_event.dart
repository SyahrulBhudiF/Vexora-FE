import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object?> get props => [];
}

class LoadMusicEvent extends MusicEvent {
  final String musicId;

  const LoadMusicEvent({required this.musicId});

  @override
  List<Object?> get props => [musicId];
}
