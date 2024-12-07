// most_mood_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart' as logging;
import 'package:vexora_fe/blocs/topmood/topmood_event.dart';
import 'package:vexora_fe/blocs/topmood/topmood_state.dart';
import 'package:vexora_fe/controller/history_controller.dart';

class MostMoodBloc extends Bloc<MostMoodEvent, MostMoodState> {
  final HistoryController historyController;
  final logging.Logger _logger = logging.Logger('MostMoodBloc');

  MostMoodBloc({required this.historyController}) : super(MostMoodInitial()) {
    on<GetMostMoodEvent>((event, emit) async {
      _logger.info("Get most mood event: $event");
      emit(MostMoodLoading());
      try {
        _logger.info("Start get most mood for userId: ${event.userId}");
        final response = await historyController.getMostMood(event.userId);
        _logger.info("Response: $response");

        response.fold(
          (failure) {
            _logger.warning("Failed to load mood: $failure");
            emit(MostMoodFailure(message: failure));
          },
          (mood) {
            _logger.info("Successfully loaded mood: $mood");
            emit(MostMoodSuccess(mood: mood));
          },
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(MostMoodFailure(message: e.toString()));
      }
    });
  }
}
