import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/scan/scan.dart';
import '../presentation/homepage/homepage.dart';

class AppRoutes {
  static const String homepageInitial = "/home_page_initial";
  static const String homepage = "/homepage";
  static const String scan = "/scan";

  static Map<String, WidgetBuilder> routes = {
    homepage: (context) => HomeScreen(),
    scan: (context) => ScanScreen(),
  };
}
