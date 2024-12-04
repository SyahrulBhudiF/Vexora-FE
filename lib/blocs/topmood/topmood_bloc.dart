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
        _logger.info("Start get most mood");
        final response = await historyController.getMostMood();
        _logger.info("Response: $response");

        response.fold(
          (failure) => emit(MostMoodFailure(message: failure)),
          (mood) => emit(MostMoodSuccess(mood: mood)), // Emit mood
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(MostMoodFailure(message: e.toString()));
      }
    });
  }
}

