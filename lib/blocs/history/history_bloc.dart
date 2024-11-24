import 'package:vexora_fe/blocs/history/history_event.dart';
import 'package:vexora_fe/blocs/history/history_state.dart';
import 'package:vexora_fe/controller/history_controller.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:logging/logging.dart' as logging;


class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryController historyController;
  final logging.Logger _logger = logging.Logger('HistoryBloc');

  HistoryBloc({required this.historyController}) : super(HistoryInitial()) {
    on<HistoryGetEvent>((event, emit) async {
      _logger.info("Get event: $event");
      emit(HistoryLoading());
      try {
        _logger.info("Start get");
        final response = await historyController.getHistory();
        _logger.info("Response: $response");
        response.fold(
          (l) => emit(HistoryFailure(message: l)),
          (r) => emit(HistorySuccess(history: r)),
        );
      } catch (e) {
        _logger.severe("Error: $e");
        emit(HistoryFailure(message: e.toString()));
      }
    });
  }

 
}