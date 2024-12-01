  import 'dart:io';

  class ScanFaceDto {
    final String? userId;
    final File? faceScan;

    ScanFaceDto({
      required this.userId,
      required this.faceScan,
    });

    // Mengkonversi objek LoginDTO ke dalam bentuk map untuk serialisasi
    Map<String, dynamic> toJson() {
      return {
        'user_id': userId,
        'image': faceScan,
      };
    }

    ScanFaceDto copyWith({
      String? userId,
      File? faceScan,
    }) {
      return ScanFaceDto(
        userId: userId ?? this.userId,
        faceScan: faceScan ?? this.faceScan,
      );
    }
  }
