import 'package:flutter/material.dart';
import 'package:vexora_fe/core/theme/app_colors.dart';


class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      bodySmall: TextStyle(color: Colors.black87, fontSize: 12),
      labelSmall: TextStyle(color: Colors.black87, fontSize: 10),
    ),
  );
}
