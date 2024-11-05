import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widget/custom_elevated_button.dart';

class HistorylistItemWidget extends StatelessWidget {
  const HistorylistItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray4007f.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.happyIcon,
                    height: 60.h,
                    width: 60.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.h,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Text(
                            "Happy",
                            textAlign: TextAlign.left,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.time,
                              height: 14.h,
                              width: 14.h,
                            ),
                            SizedBox(width: 2.h),
                            Text(
                              "09.10 12 April 2024",
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            height: 40.h,
            width: 114.h,
            text: "Your Playlist",
            leftIcon: Container(
              margin: EdgeInsets.only(right: 2.h),
              child: CustomImageView(
                imagePath: ImageConstant.headphoneIcon,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
            buttonTextStyle: CustomTextStyles.labelLargePrimary,
          ),
        ],
      ),
    );
  }
}
