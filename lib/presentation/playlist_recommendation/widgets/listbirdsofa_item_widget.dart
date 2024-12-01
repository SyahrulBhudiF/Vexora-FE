import 'package:flutter/material.dart';
import 'package:vexora_fe/data/models/dto/Responses/scanFace_response.dart';
import '../../../core/app_export.dart';
import '../../../widget/custom_icon_button.dart'; // Adjust this import path accordingly

class ListplaylistItemWidget extends StatelessWidget {
  final Track data;
  const ListplaylistItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Added Material widget here
      color: Colors
          .transparent, // Set transparent if you don't need a background color
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: data.thumbnail, // Ensure the path is correct
                    height: 68.h,
                    width: 74.h,
                    radius: BorderRadius.circular(8.h),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: CustomTextStyles.titleMediumSemiBold
                                .copyWith(color: theme.colorScheme.onPrimary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data.artist,
                            style: CustomTextStyles.titleMediumSemiBold
                                .copyWith(color: theme.colorScheme.onPrimary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // const Spacer(),
            CustomIconButton(
              height: 60.h,
              width: 60.h,
              padding: EdgeInsets.all(12.h),
              decoration: IconButtonStyleHelper.none,
              child: CustomImageView(
                imagePath: ImageConstant.octionPlaylist,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
