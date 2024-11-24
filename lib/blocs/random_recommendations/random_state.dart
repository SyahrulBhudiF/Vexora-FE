// lib/blocs/playlist/playlist_state.dart

import 'package:equatable/equatable.dart';

import '../../data/models/dto/Request/randomRecommendations_dto.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();

  @override
  List<Object> get props => [];

  get playlists => null;
}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  @override
  final List<PlaylistDto> playlists;

  const PlaylistLoaded({required this.playlists});

  @override
  List<Object> get props => [playlists];
}

class PlaylistFailure extends PlaylistState {
  final String message;

  const PlaylistFailure({required this.message});

  @override
  List<Object> get props => [message];
}
