class VerifyOtpDto {
  final String email;
  final String otp;

  VerifyOtpDto({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }

  VerifyOtpDto copyWith({
    String? email,
    String? otp,
  }) {
    return VerifyOtpDto(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}
