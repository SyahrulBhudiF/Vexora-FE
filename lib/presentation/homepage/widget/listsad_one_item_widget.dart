import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListsadOneItemWidget extends StatelessWidget {
  final Map<String, int> moodCounts;
  final String topMood; // Add topMood parameter

  const ListsadOneItemWidget(
      {Key? key, required this.moodCounts, required this.topMood})
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
                'Good',
                topMood == 'Good'
                    ? ImageConstant.imgGoodMood
                    : ImageConstant.imgNewHappy),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'Angry',
                topMood == 'Angry'
                    ? ImageConstant.angryKuning
                    : ImageConstant.imgAngryMood),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'Sad',
                topMood == 'Sad'
                    ? ImageConstant.sadKuning
                    : ImageConstant.imgSadMood),
            SizedBox(width: 12.h),
            _buildMoodColumn(
                'Neutral',
                topMood == 'Neutral'
                    ? ImageConstant.calmKuning
                    : ImageConstant.imgCalmMood),
          ],
        ),
      ),
    );
  }

  // Helper method to build each mood column
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
