import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:flutter/services.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme, // Define your theme here
          title: 'Vexora',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.history,
          routes: AppRoutes.routes,
          // home: HomeScreen(),
        );
      },
    );
  }
}