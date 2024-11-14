import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_subtitle.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_elevated_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 22.h,
              ),
              _buildMoodSection(context),
              SizedBox(
                height: 52.h,
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.h),
                  decoration: BoxDecoration(
                    color: appTheme.gray30003.withOpacity(0.31),
                    borderRadius: BorderRadiusStyle.customBorderTL32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tips",
                        style: CustomTextStyles.titleLargeMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Saat senang ya party",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Result",
      ),
    );
  }

  Widget _buildMoodSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 24.h, right: 36.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.happyIcon,
                  height: 120.h,
                  width: 120.h,
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: theme.textTheme.titleSmall,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 54.h),
                              child: Text(
                                "Mood",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            CustomImageView(
                              color: theme.colorScheme.onPrimary,
                              imagePath: ImageConstant.imgClock,
                              height: 14.h,
                              width: 14.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text(
                                "09.10 12 April 2024",
                                style: CustomTextStyles.labelMediumOnPrimary_1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "Happy",
                                style: CustomTextStyles.labelMediumOnPrimary_1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.playlist);
                        },
                        height: 40.h,
                        text: "Your Playlist",
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgHeadps,
                            height: 24.h,
                            width: 24.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        buttonTextStyle: CustomTextStyles.labelLargePrimary,
                      ),
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
