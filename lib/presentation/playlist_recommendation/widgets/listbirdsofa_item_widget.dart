import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widget/custom_icon_button.dart'; // Adjust this import path accordingly

class ListplaylistItemWidget extends StatelessWidget {
  const ListplaylistItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material( // Added Material widget here
      color: Colors.transparent, // Set transparent if you don't need a background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.playlist, // Ensure the path is correct
            height: 68.h,
            width: 74.h,
            radius: BorderRadius.circular(8.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text(
              "Playlist Galau",
              style: CustomTextStyles.titleMediumSemiBold.copyWith(
              color: theme.colorScheme.onPrimary),
            ),
          ),
          Spacer(),
          CustomIconButton(
            height: 60.h,
            width: 60.h,
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.octionIcon,
            ),
          ),
        ],
      ),
    );
  }
}
