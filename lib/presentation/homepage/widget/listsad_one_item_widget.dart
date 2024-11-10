import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListsadOneItemWidget extends StatelessWidget {
  const ListsadOneItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h, // Meningkatkan tinggi agar tidak terlalu sempit
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGoodMood,
                  height: 60.h,
                  width: 60.h,
                ),
                Text(
                  "Good",
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray40002,
                ),
              ],
            ),
            SizedBox(width: 12.h),
            Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgAngryMood,
                  height: 60.h,
                  width: 60.h,
                ),
                Text(
                  "Angry",
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray40002,
                ),
              ],
            ),
            SizedBox(width: 12.h),
            Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgSadMood,
                  height: 60.h,
                  width: 60.h,
                ),
                Text(
                  "Sad",
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray40002,
                ),
              ],
            ),
            SizedBox(width: 12.h),
            Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalmMood,
                  height: 60.h,
                  width: 60.h,
                ),
                Text(
                  "Calm",
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray40002,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
