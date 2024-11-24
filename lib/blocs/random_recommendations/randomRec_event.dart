// lib/blocs/playlist/playlist_event.dart

import 'package:equatable/equatable.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();

  @override
  List<Object> get props => [];
}

class LoadPlaylistsEvent extends PlaylistEvent {}
