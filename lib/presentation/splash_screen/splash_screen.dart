import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/welcome_screen/welcome_screen.dart';
import '../../core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 878.h,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.bigLogo,
                height: 166.h,
                width: 132.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
