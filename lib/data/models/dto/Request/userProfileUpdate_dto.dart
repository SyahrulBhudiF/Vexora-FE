import 'dart:io';

class UserUpdateRequestDto {
  final String name;
  final String username;

  UserUpdateRequestDto({
    required this.name,
    required this.username,
  });

  // Method ini tidak diperlukan lagi karena kita mengirimkan file langsung menggunakan multipart/form-data
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
    };
  }

  UserUpdateRequestDto copyWith({
    String? name,
    String? username,
    // Menggunakan gambar profil yang dipilih
  }) {
    return UserUpdateRequestDto(
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }
}
