import 'dart:io';

class UserUpdateRequestDto {
  final String name;
  final String username;
  final File profilePicture;

  UserUpdateRequestDto({
    required this.name,
    required this.username,
    required this.profilePicture,
  });

  // Method ini tidak diperlukan lagi karena kita mengirimkan file langsung menggunakan multipart/form-data
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'username': username,
  //     'profile_picture': profilePicture.path,
  //   };
  // }

  UserUpdateRequestDto copyWith({
    String? name,
    String? username,
    File? profilePicture, // Menggunakan gambar profil yang dipilih
  }) {
    return UserUpdateRequestDto(
      name: name ?? this.name,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
