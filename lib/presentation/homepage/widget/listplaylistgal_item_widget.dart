import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_export.dart';

class ListplaylistgalItemWidget extends StatelessWidget {
  const ListplaylistgalItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 120.h,
            width: 120.h,
            radius: BorderRadius.circular(4.h),
          ),
          SizedBox(
            height: 4.h,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Playlist\n",
                style: CustomTextStyles.labelLargeBlack900,
              ),
              TextSpan(
                  text: "Galau Brutal",
                  style: CustomTextStyles.labelLargeBlack900_1)
            ]),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
