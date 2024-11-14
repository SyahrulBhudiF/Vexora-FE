import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Vexora',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
