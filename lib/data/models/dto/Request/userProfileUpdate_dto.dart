import 'dart:io';

class UserUpdateRequestDto {
  final String name;
  final String email;
  final String username;
  final File profilePicture;

  UserUpdateRequestDto({
    required this.name,
    required this.email,
    required this.username,
    required this.profilePicture,
  });

  // Method ini tidak diperlukan lagi karena kita mengirimkan file langsung menggunakan multipart/form-data
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
    };
  }

  UserUpdateRequestDto copyWith({
    String? name,
    String? email,
    String? username,
    File? profilePicture, // Menggunakan gambar profil yang dipilih
  }) {
    return UserUpdateRequestDto(
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
