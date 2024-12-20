import 'package:equatable/equatable.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';

import '../../data/models/Music/music_model.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object?> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final List<Track> music;

  const MusicLoaded({required this.music});

  @override
  List<Object?> get props => [music];
}

class MusicError extends MusicState {
  final String message;

  const MusicError({required this.message});

  @override
  List<Object?> get props => [message];
}
