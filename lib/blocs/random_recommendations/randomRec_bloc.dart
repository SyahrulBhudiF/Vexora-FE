import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:vexora_fe/blocs/random_recommendations/randomRec_event.dart';
import 'package:vexora_fe/blocs/random_recommendations/random_state.dart';

import '../../controller/randomRecommendations_controller.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistController playlistController;
  final Logger _logger = Logger('PlaylistBloc');

  PlaylistBloc({required this.playlistController}) : super(PlaylistInitial()) {
    on<LoadPlaylistsEvent>((event, emit) async {
      _logger.info("Load playlists event triggered");

      emit(PlaylistLoading());
      try {
        final response = await playlistController.getPlaylists();
        _logger.info("Response received: $response");
        response.fold(
          (l) {
            _logger.severe("Error occurred: $l");
            emit(PlaylistFailure(message: l));
          },
          (r) {
            _logger
                .info("Playlists loaded successfully: ${r.length} playlists");
            emit(PlaylistLoaded(playlists: r));
          },
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(PlaylistFailure(message: e.toString()));
      }
    });
  }
}
