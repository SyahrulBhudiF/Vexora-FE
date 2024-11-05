import 'package:flutter/material.dart';
import '../presentation/history_screen/history_screen.dart';
import '../presentation/homepage/homepage.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/register/register_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String homepageInitial = "/home_page_initial";
  static const String homepage = "/homepage";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String history = "/history";





  static Map<String, WidgetBuilder> routes = {
    homepage: (context) => HomeScreen(),
    welcome: (context) => const WelcomeScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    history: (context) => HistoryScreen(),



  };
}
