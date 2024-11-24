import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/UserProfile/userProfile_event.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/app_bar/appbar_title.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';

import '../../blocs/UserProfile/userProfile_bloc.dart';
import '../../blocs/UserProfile/userProfile_state.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildProfileColumn(context)],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 46.h,
      centerTitle: true,
      title: AppbarTitle(text: "More"),
    );
  }

  Widget _buildProfileColumn(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileLoaded) {
          Navigator.pushNamed(context, AppRoutes.profile);
        }
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 4.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<UserProfileBloc>().add(FetchUserProfile());
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.accountCircle,
                      height: 22.h,
                      width: 26.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "Profile",
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
                ),
              ),
            ),
            SizedBox(height: 12.h),
            const SizedBox(
              width: double.maxFinite,
              child: Divider(),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.history);
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.logout,
                      height: 22.h,
                      width: 26.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "History",
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
                ),
              ),
            ),
            SizedBox(height: 12.h),
            const SizedBox(
              width: double.maxFinite,
              child: Divider(),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.password);
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.password,
                      height: 22.h,
                      width: 26.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "ChangePassword",
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
                ),
              ),
            ),
            SizedBox(height: 12.h),
            const SizedBox(
              width: double.maxFinite,
              child: Divider(),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.logout);
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.logout,
                      height: 22.h,
                      width: 26.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "Logout",
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
