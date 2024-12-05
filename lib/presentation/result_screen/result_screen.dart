import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vexora_fe/blocs/ScanFace/scanFace_bloc.dart';
import 'package:vexora_fe/blocs/ScanFace/scanFace_state.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_subtitle.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/custom_elevated_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  // Map mood to appropriate icon
  String _getMoodIcon(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return ImageConstant.happyIcon;
      case 'sad':
        return ImageConstant.sadKuning;
      case 'angry':
        return ImageConstant.angryKuning;
      case 'neutral':
        return ImageConstant.calmKuning;
      default:
        return ImageConstant.happyIcon; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    // final data = scanResult.data;
    // final detectedMood = data.detectedMood ?? 'Unknown';
    // final confidenceScore = data.confidenceScore ?? 0;

    return SafeArea(
      child: BlocBuilder<ScanFaceBloc, ScanFaceState>(
        builder: (context, state) {
          if (state is ScanFaceSuccess) {
            final data = state.data;
            final detectedMood = data.detectedMood ?? 'Unknown';

            return Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 22.h),
                    _buildMoodSection(context,
                        mood: detectedMood,
                        moodIcon: _getMoodIcon(detectedMood)),
                    SizedBox(height: 52.h),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 32.h),
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
                            SizedBox(height: 10.h),
                            Text(
                              _getMoodTips(detectedMood),
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
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  // Mood-specific tips
  String _getMoodTips(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return "Saat senang, nikmati momen bahagia ini! Dengarkan musik yang membuatmu semakin bahagia dan berbagi kegembiraan dengan orang-orang terdekat.";
      case 'sad':
        return "Sedang merasa sedih? Dengarkan musik yang menenangkan, berbicara dengan teman, atau lakukan aktivitas yang kamu sukai untuk mengangkat mood.";
      case 'angry':
        return "Jika sedang marah, cobalah menenangkan diri dengan musik yang meredakan emosi. Tarik nafas perlahan dan fokus pada hal-hal positif.";
      case 'neutral':
        return "Mood netral adalah kesempatan untuk mengeksplorasi perasaan baru. Dengarkan musik yang dapat menginspirasi dan memotivasi.";
      default:
        return "Setiap mood memiliki keunikannya sendiri. Nikmati momen ini dan dengarkan musik yang sesuai dengan perasaanmu.";
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Result",
      ),
    );
  }

  Widget _buildMoodSection(BuildContext context,
      {required String mood, required String moodIcon}) {
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
                  imagePath: moodIcon,
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
                                DateFormat('HH.mm dd MMMM yyyy')
                                    .format(DateTime.now()),
                                style: CustomTextStyles.labelMediumOnPrimary_1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                mood,
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
