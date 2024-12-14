import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/logout_dialog/logout_dialog.dart';
import 'package:vexora_fe/presentation/password_screen/password_screen.dart';
import 'package:vexora_fe/presentation/profile/profile_screen.dart';
import 'package:vexora_fe/presentation/resetpass_screen/resetpass_screen.dart';
import 'package:vexora_fe/presentation/result_screen/result_screen.dart';
import 'package:vexora_fe/presentation/scan/scan.dart';
import 'package:vexora_fe/presentation/scan_one/scan_one.dart';
import 'package:vexora_fe/widget/custom_buttom_app_bar.dart';
import '../presentation/history_screen/history_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/otp_screen/otp_screen.dart';
import '../presentation/playlistHistory/playlist_history.dart';
import '../presentation/playlist_recommendation/playlist_recommendation.dart';
import '../presentation/register/register_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String homepageInitial = "/homepage_initial";
  // static const String homepage = "/homepage";
  static const String scan = "/scan";
  static const String scanOne = "/scanOne";
  static const String homepage = "/homepage";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String history = "/history";
  static const String splash = "/splash_screen";
  static const String playlist = "/playlist";
  static const String result = "/result";
  static const String profile = "/profile";
  static const String password = "/password";
  static const String logout = "/logout";
  static const String otpCode = "/otp_code";
  static const String playlistHistory = "/playlist_history";
  static const String resetpass = "/reset_password";

  static Map<String, WidgetBuilder> routes = {
    scan: (context) => const ScanScreen(),
    scanOne: (context) => const ScanOneScreen(
          imagePath: '',
        ),
    homepageInitial: (context) => const BottomNavigationBarNew(),
    welcome: (context) => const WelcomeScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    history: (context) => HistoryScreen(),
    splash: (context) => const SplashScreen(),
    playlist: (context) => const PlaylistRecommendation(),
    playlistHistory: (context) => const PlaylistHistory(),
    result: (context) => ResultScreen(),
    profile: (context) => ProfileScreen(),
    password: (context) => PasswordScreen(),
    logout: (context) => const LogoutDialog(),
    otpCode: (context) => OtpScreen(),
    resetpass: (context) => ResetPasswordScreen(),
  };
}
