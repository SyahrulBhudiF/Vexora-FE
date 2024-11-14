class ChangePasswordDto {
  final String current_password;
  final String new_password;

  ChangePasswordDto({
    required this.current_password,
    required this.new_password,
  });

  // Mengkonversi objek LoginDTO ke dalam bentuk map untuk serialisasi
  Map<String, dynamic> toJson() {
    return {
      'current_password': current_password,
      'new_password': new_password,
    };
  }

  ChangePasswordDto copyWith({
    String? current_password,
    String? new_password,
  }) {
    return ChangePasswordDto(
      current_password: current_password ?? this.current_password,
      new_password: new_password ?? this.new_password,
    );
  }
}
