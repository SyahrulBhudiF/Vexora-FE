import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';

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
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGoodMood,
                  height: 60.h,
                  width: 60.h,
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgClock,
                            height: 14.h,
                            width: 14.h,
                          ),
                          SizedBox(width: 2.h),
                          Flexible(
                            child: Text(
                              "09.10 12 April 2024",
                              style: theme.textTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            height: 30.h,
            width: 140.h,
            text: 'Your Playlist', // Pastikan teks tidak overflow
            leftIcon: Container(
              margin: EdgeInsets.only(right: 10.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgHeadps,
                height: 10.h,
                width: 10.h,
                fit: BoxFit.contain,
              ),
            ),
            buttonTextStyle: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
