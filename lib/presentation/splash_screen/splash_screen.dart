import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/welcome_screen/welcome_screen.dart';
import 'package:vexora_fe/widget/custom_buttom_app_bar.dart';
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
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
