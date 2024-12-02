import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/history_controller.dart';
import 'music_event.dart';
import 'music_state.dart';
import 'package:logging/logging.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final HistoryController historyController;
  final Logger _logger = Logger('MusicBloc');

  MusicBloc({required this.historyController}) : super(MusicInitial()) {
    on<LoadMusicEvent>((event, emit) async {
      _logger.info("LoadMusicEvent: $event");
      emit(MusicLoading()); // Emit loading state
      try {
        _logger.info("Loading music data...");
        final response = await historyController.getMusicHistory(event.musicId);
        response.fold(
          (l) {
            _logger.severe("Error loading music: $l");
            emit(MusicError(message: l));
          },
          (r) {
            _logger.info("Music data loaded: $r");
            emit(MusicLoaded(music: r));
          },
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(MusicError(message: e.toString()));
      }
    });
  }
}
