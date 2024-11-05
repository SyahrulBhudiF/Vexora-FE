import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class SplashScreen extends StatelessWidget {
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
              width: 132.h,)
          ],
        ),
       ),
       ),
    );
  }
}