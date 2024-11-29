class ChangePasswordDto {
  final String previous_password;
  final String new_password;

  ChangePasswordDto({
    required this.previous_password,
    required this.new_password,
  });

  // Mengkonversi objek LoginDTO ke dalam bentuk map untuk serialisasi
  Map<String, dynamic> toJson() {
    return {
      'previous_password': previous_password,
      'new_password': new_password,
    };
  }

  ChangePasswordDto copyWith({
    String? previous_password,
    String? new_password,
  }) {
    return ChangePasswordDto(
      previous_password: previous_password ?? this.previous_password,
      new_password: new_password ?? this.new_password,
    );
  }
}
