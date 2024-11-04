import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widget/listhappy_one_item_widget.dart';
import 'widget/listplaylistgal_item_widget.dart';
import 'widget/listsad_one_item_widget.dart';

class HomepageInitial extends StatefulWidget {
  HomepageInitial({Key? key}) : super(key: key);

  @override
  HomepageInitialState createState() => HomepageInitialState();
}

class HomepageInitialState extends State<HomepageInitial> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 898.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 26.h),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius: BorderRadiusStyle.customBorderTL40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  _buildTopMoodSection(context),
                  SizedBox(height: 28.h),
                  _buildYourPlaylistSection(context),
                ],
              ),
            ),
            _buildWelcomeSection(context),
          ],
        ),
      ),
    );
  }

  // section widget
  Widget _buildTopMoodSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Mood",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 42.h),
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Wrap(direction: Axis.horizontal, spacing: 10.h, children: [
                  ListsadOneItemWidget(),
                ]),
              )),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History Mood",
                  style: theme.textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: CustomTextStyles.bodySmallPrimary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListhappyOneItemWidget();
            },
          )
        ],
      ),
    );
  }

  // section widget
  Widget _buildYourPlaylistSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.maxFinite,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Playlist",
                      style: theme.textTheme.titleMedium,
                    ),
                  ])),
          SizedBox(
            height: 8.h,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 20.h,
                children: List.generate(4, (index) {
                  return ListplaylistgalItemWidget();
                }),
              ),
            ),
          ),
          SizedBox(
            height: 55.h,
          )
        ],
      ),
    );
  }

  // section widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 38.h, left: 26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 180.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Pastikan semua children berada di bagian atas
                  children: [
                    SizedBox(
                      height: 46.h,
                      width: 50.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgUser,
                            height: 40.h,
                            width: 34.h,
                            radius: BorderRadius.circular(8.h),
                            alignment: Alignment.centerLeft,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgNavHome,
                            height: 42.h,
                            width: 42.h,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 12.h,
                              width: 12.h,
                              margin: EdgeInsets.only(left: 14.h, bottom: 8.h),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(6.h),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgLogoVexora,
                      height: 40.h,
                      width: 40.h,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      "Hello, Rizky",
                      style: CustomTextStyles.titleLargeSemiBold,
                    ),
                  ),
                ),
                SizedBox(width: 90.h),
                CustomImageView(
                  imagePath: ImageConstant.imgHomePage,
                  height: 175.h,
                  width: 175.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // navigates to the historyScreen when the action is triggred
  // onTapTxtSeeallone(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.historyScreen);
  // }
}
