import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/app_bar/appbar_leading_image.dart';
import 'package:vexora_fe/widget/app_bar/appbar_title.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_buttom_app_bar.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import 'package:vexora_fe/widget/custom_floating_button.dart';
import 'package:vexora_fe/widget/custom_icon_button.dart';
import 'package:vexora_fe/widget/custom_text_form_field.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 18.h,
              top: 24.h,
              right: 18.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadiusStyle.circleBorder42,
                  ),
                  child: Container(
                    height: 84.h,
                    width: 86.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.circleBorder42,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 1.h,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgUnsplashNsbl2cfwnme,
                          height: 80.h,
                          width: 80.h,
                          radius: BorderRadius.circular(
                            40.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.h),
                          child: CustomIconButton(
                            height: 20.h,
                            width: 20.h,
                            padding: EdgeInsets.all(4.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgAddPhoto24d,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildProfileForm(context),
                SizedBox(height: 68.h),
                _buildSaveButton(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
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
      leadingWidth: 44.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        height: 20.h,
        width: 20.h,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {},
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Edit Profile",
      ),
    );
  }


  Widget _buildNameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: nameInputController,
        hintText: "Enter your name",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: emailInputController,
        hintText: "Enter your email",
        textInputType: TextInputType.emailAddress,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildUsernameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: usernameInputController,
        hintText: "Enter your username",
        textInputAction: TextInputAction.done,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            "Name",
            style: theme.textTheme. titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildNameInput(context),
          SizedBox(height: 18.h),
          Text(
            "Email",
            style: theme. textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildEmailInput(context),
          SizedBox(height: 18.h),
          Text(
            "Username",
            style: theme. textTheme. titleMedium,
          ),
          SizedBox(height: 8.h),
          _buildUsernameInput(context)
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Save",
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomAppBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type)
          );
        },
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homepageInitial;
      case BottomBarEnum.More:
        return "/";
      default:
        return "/";
    }
  }

  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}