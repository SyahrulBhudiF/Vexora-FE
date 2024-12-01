// scan_face_event.dart
import '../../data/models/dto/Request/scanFace_dto.dart';

abstract class ScanFaceEvent {}

class ScanFaceRequestEvent extends ScanFaceEvent {
  final ScanFaceDto request;

  ScanFaceRequestEvent({required this.request});
}
