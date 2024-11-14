class RegisterDto {
  final String name;
  final String email;
  final String username;
  final String password;

  RegisterDto({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  // Mengkonversi objek LoginDTO ke dalam bentuk map untuk serialisasi
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  RegisterDto copyWith({
    String? name,
    String? email,
    String? username,
    String? password,
  }) {
    return RegisterDto(
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
