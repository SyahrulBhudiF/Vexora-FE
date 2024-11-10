import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/scan/scan.dart';
import 'package:vexora_fe/presentation/scan_one/scan_one.dart';
import 'package:vexora_fe/widget/custom_buttom_app_bar.dart';

class AppRoutes {
  static const String homepageInitial = "/home_page_initial";
  // static const String homepage = "/homepage";
  static const String scan = "/scan";
  static const String scanOne = "/scanOne";

  static Map<String, WidgetBuilder> routes = {
    // homepage: (context) => HomeScreen(),
    scan: (context) => const ScanScreen(),
    scanOne: (context) => const ScanOneScreen(
          imagePath: '',
        ),
    homepageInitial: (context) => BottomNavigationBarNew(),
  };
}
