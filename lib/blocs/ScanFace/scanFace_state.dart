// scan_face_state.dart
import '../../data/models/dto/Responses/scanFace_response.dart';

abstract class ScanFaceState {}

class ScanFaceInitial extends ScanFaceState {}

class ScanFaceLoading extends ScanFaceState {}

class ScanFaceSuccess extends ScanFaceState {
  final Data data;

  ScanFaceSuccess({required this.data});
}

class ScanFaceFailure extends ScanFaceState {
  final String message;

  ScanFaceFailure({required this.message});
}
