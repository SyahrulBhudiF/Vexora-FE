import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListsadOneItemWidget extends StatelessWidget {
  const ListsadOneItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 60.h,
            width: 60.h,
          ),
          Text(
            "Sad",
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleSmallGray40002,
          )
        ],
      ),
    );
  }
}
