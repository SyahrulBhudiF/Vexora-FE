import 'package:flutter/material.dart';
import '../presentation/homepage/homepage.dart';

class AppRoutes {
  static const String homepageInitial = "/home_page_initial";
  static const String homepage = "/homepage";

  static Map<String, WidgetBuilder> routes = {
    homepage: (context) => HomeScreen(),
  };
}
