class LoginDto {
  final String username;
  final String password;

  LoginDto({
    required this.username,
    required this.password,
  });

  // Mengkonversi objek LoginDTO ke dalam bentuk map untuk serialisasi
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  LoginDto copyWith({
    String? username,
    String? password,
  }) {
    return LoginDto(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
