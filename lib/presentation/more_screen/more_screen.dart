import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/app_bar/appbar_title.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_floating_button.dart';

// ignore: must_be_immutable
class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildProfileColumn(context)],
          ),
        ),
        // bottomNavigationBar: SizedBox(
        //   width: double.maxFinite,
        //   child: _buildBottomNavigationBar(context),
        // ),
        floatingActionButton: CustomFloatingButton(
          height: 74,
          width: 74,
          backgroundColor: theme.colorScheme.primary,
          child: CustomImageView(
            imagePath: ImageConstant.imgCamera,
            height: 37.0.h,
            width: 37.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 46.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "More"
      ),
    );
  }

  Widget _buildProfileColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 4.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildHistoryRow(
              context,
              logoutIcon: ImageConstant.accountCircle,
              historyText: "Profile",
            ),
          ),
          SizedBox(height: 12.h),
          const SizedBox(
            width: double.maxFinite,
            child: Divider(),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildHistoryRow(
              context,
              logoutIcon: ImageConstant.logout,
              historyText: "History",
            ),
          ),
          SizedBox(height: 12.h),
          const SizedBox(
            width: double.maxFinite,
            child: Divider(),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildHistoryRow(
              context,
              logoutIcon: ImageConstant.password,
              historyText: "ChangePassword",
            ),
          ),
          SizedBox(height: 12.h),
          const SizedBox(
            width: double.maxFinite,
            child: Divider(),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildHistoryRow(
              context,
              logoutIcon: ImageConstant.logout,
              historyText: "Logout",
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar(BuildContext context) {
  //   return SizedBox(
  //     width: double.maxFinite,
  //     child: CustomBottomAppBar(
  //       onChanged: (BottomBarEnum type) {
  //         Navigator.pushNamed(
  //             navigatorKey.currentContext!, getCurrentRoute(type));
  //       },
  //     ),
  //   );
  // }

  Widget _buildHistoryRow(
    BuildContext context, {
      required String historyText,
      required String logoutIcon,
    }) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: logoutIcon,
            height: 22.h,
            width: 26.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Text(
              historyText,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: appTheme.black900,
              ),
            ),
          ),
          const Spacer(),
          CustomImageView(
            imagePath: ImageConstant.arrorRight,
            height: 22.h,
            width: 26.h,
          )
        ],
      );
    }

    // String getCurrentRoute(BottomBarEnum type) {
    //   switch (type) {
    //     case BottomBarEnum.Home:
    //       return AppRoutes.homepageInitialPage;
    //     case BottomBarEnum.More:
    //       return "/";
    //     default:
    //       return "/";
    //   }
    // }
}