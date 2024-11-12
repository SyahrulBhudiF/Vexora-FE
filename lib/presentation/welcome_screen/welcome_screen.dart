import 'package:flutter/material.dart';
import 'package:vexora_fe/widget/custom_outlined_button.dart';
import '../../core/app_export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 24.h,
                top: 15.h,
                right: 24.h,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 138.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 46.h,
                          width: 50.h,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.smallLogo,
                                height: 40.h,
                                width: 34.h,
                                radius: BorderRadius.circular(8.h),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.h),
                        Text(
                          "Vexora",
                          style: CustomTextStyles.titleLargeBold,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 24.h),
                  Text(
                    "A solution for music that matches your mood",
                    style: CustomTextStyles.labelLargePurple50,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      "Everything for your mood, Everything for your music just here at all !",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.headlineSmallOnPrimary,
                    ),
                  ),
                  SizedBox(height: 62.h),
                  CustomImageView(
                    imagePath: ImageConstant.imageWelcome,
                    height: 300.h,
                    width: 300.h,
                  ),
                  SizedBox(height: 134.h),
                  CustomOutlinedButton(
                    height: 64.h,
                    text: "Get started",
                    margin: EdgeInsets.only(right: 2.h),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
