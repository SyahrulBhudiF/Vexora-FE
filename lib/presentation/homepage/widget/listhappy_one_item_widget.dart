import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_export.dart';
import '../../../widget/custom_elevated_button.dart';

class ListhappyOneItemWidget extends StatelessWidget {
  const ListhappyOneItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.h),
      decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder12,
          boxShadow: [
            BoxShadow(
              color: Color(0X7FBABABA).withOpacity(0.25),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 4),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 60.h,
                    width: 60.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.h, vertical: 2.h),
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
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgNavHome,
                              height: 14.h,
                              width: 14.h,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Text("09.10 12 April 2024",
                                style: theme.textTheme.labelMedium)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            height: 22.h,
            width: 102.h,
            text: 'Your Playlist',
            leftIcon: Container(
              margin: EdgeInsets.only(right: 2.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgNavMore,
                height: 18.h,
                width: 18.h,
                fit: BoxFit.contain,
              ),
            ),
            buttonTextStyle: theme.textTheme.labelMedium!,
          )
        ],
      ),
    );
  }
}
