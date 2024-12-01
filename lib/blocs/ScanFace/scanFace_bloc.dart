  // scan_face_bloc.dart
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:vexora_fe/blocs/ScanFace/scanFace_event.dart';
  import 'package:vexora_fe/blocs/ScanFace/scanFace_state.dart';
  import 'package:vexora_fe/controller/scanFace_controller.dart';

  import 'package:logging/logging.dart';

  class ScanFaceBloc extends Bloc<ScanFaceEvent, ScanFaceState> {
    final ScanFaceController scanFaceController;
    final Logger _logger = Logger('ScanFaceBloc');

    ScanFaceBloc({required this.scanFaceController}) : super(ScanFaceInitial()) {
      on<ScanFaceRequestEvent>((event, emit) async {
        _logger.info("ScanFace Request event: $event");
        emit(ScanFaceLoading()); // Emit loading state
        try {
          _logger.info("Starting face scan...");
          final response = await scanFaceController.getScanFace(event.request);
          _logger.info("Response: $response");

          response.fold(
            (l) => emit(ScanFaceFailure(message: l)),
            (r) => emit(ScanFaceSuccess(data: r)),
          );
        } catch (e) {
          _logger.severe("Error: $e");
          emit(ScanFaceFailure(message: e.toString()));
        }
      });
    }
  }
