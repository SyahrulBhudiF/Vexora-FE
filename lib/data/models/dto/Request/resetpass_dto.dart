class ResetPasswordDto {
  final String email;
  final String otp;
  final String newpassword;

  ResetPasswordDto({
    required this.email,
    required this.otp,
    required this.newpassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
      'new_password': newpassword,
    };
  }

  ResetPasswordDto copyWith({
    String? email,
    String? otp,
    String? newpassword,
  }) {
    return ResetPasswordDto(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      newpassword: newpassword ?? this.newpassword,
    );
  }
}
