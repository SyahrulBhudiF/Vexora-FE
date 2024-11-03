import 'package:flutter/material.dart';
import 'package:vexora_fe/core/utils/size_utils.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_subtitle_one.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_icon_button.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.imgScan), fit: BoxFit.fill)),
          child: Container(
            margin: EdgeInsets.only(top: 56.h),
            padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 56.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Spacer(), _buildGalleryColumn(context)],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarSubtitleOne(
          text: "Take Your Picture",
        ));
  }

  Widget _buildGalleryColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: appTheme.black900.withOpacity(0.45),
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 20.h,
                      width: 22.h,
                      margin: EdgeInsets.only(left: 8.h),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Gallery",
                      style: CustomTextStyles.labelMediumOnPrimary,
                    )
                  ],
                ),
                CustomIconButton(
                  height: 50.h,
                  width: 50.h,
                  padding: EdgeInsets.all(10.h),
                  decoration: IconButtonStyleHelper.outlineOnPrimary,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup24,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFlipCameraIos,
                        height: 24.h,
                        width: 24.h,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Flip",
                        style: CustomTextStyles.labelMediumOnPrimary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// section widget
