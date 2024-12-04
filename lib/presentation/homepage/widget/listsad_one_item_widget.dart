import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListsadOneItemWidget extends StatelessWidget {
  final String topMood; // Hanya gunakan topMood

  const ListsadOneItemWidget({Key? key, required this.topMood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildMoodColumn(
                'good',
                topMood == 'good'
                    ? ImageConstant.imgGoodMood
                    : ImageConstant.imgNewHappy),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'angry',
                topMood == 'angry'
                    ? ImageConstant.angryKuning
                    : ImageConstant.imgAngryMood),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'sad',
                topMood == 'sad'
                    ? ImageConstant.sadKuning
                    : ImageConstant.imgSadMood),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'neutral',
                topMood == 'neutral'
                    ? ImageConstant.calmKuning
                    : ImageConstant.imgCalmMood),
          ],
        ),
      ),
    );
  }

  Column _buildMoodColumn(String mood, String imagePath) {
    return Column(
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: 60.h,
          width: 60.h,
        ),
        Text(
          mood,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleSmallGray40002,
        ),
      ],
    );
  }
}
