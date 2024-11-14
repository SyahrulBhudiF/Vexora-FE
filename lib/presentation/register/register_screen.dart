import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController usernameInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 870.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imageRegister,
                        height: 166.h,
                        width: 252.h,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 36.h),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildArrowNavigation(context),
                            const Spacer(flex: 2),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 28.h),
                              decoration: BoxDecoration(
                                color: appTheme.gray50,
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL32,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      "Register Account",
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.h),
                                    child: Text(
                                      "Hello!",
                                      style:
                                          CustomTextStyles.titleLargeBlack900,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.h),
                                    child: Text(
                                      "Create an account to continue",
                                      style:
                                          CustomTextStyles.titleSmallBlack900,
                                    ),
                                  ),
                                  SizedBox(height: 18.h),
                                  _buildRegistrationForm(context),
                                  SizedBox(height: 54.h),
                                  _buildRegisterButton(context),
                                  SizedBox(height: 24.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArrowNavigation(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.arrowLeft,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(top: 20.h),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 84.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 46.h,
                            width: 50.h,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.smallLogo,
                                  height: 40.h,
                                  width: 34.h,
                                  radius: BorderRadius.circular(8.h),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "Vexora",
                              style: CustomTextStyles.titleLargeBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: nameInputController,
        hintText: "Enter your name",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: usernameInputController,
        hintText: "Enter your username",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: passwordInputController,
        hintText: "Enter your password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.fromLTRB(12.h, 16.h, 30.h, 16.h),
        suffix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 16.h, 30.h, 16.h),
          child: CustomImageView(
            imagePath: ImageConstant.visiblePassword,
            height: 24.h,
            width: 24.h,
            fit: BoxFit.contain,
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
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

  /// Section Widget
  Widget _buildRegistrationForm(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildNameInput(context),
          SizedBox(height: 14.h),
          Text(
            "Email",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildEmailInput(context),
          SizedBox(height: 14.h),
          Text(
            "Username",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildUsernameInput(context),
          SizedBox(height: 14.h),
          Text(
            "Password",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.h),
          _buildPasswordInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            text: "Register",
            margin: EdgeInsets.symmetric(horizontal: 6.h),
            buttonStyle: CustomButtonStyles.fillPrimary,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homepageInitial);
            },
          ),
          SizedBox(
              height:
                  16.0), // Tambahkan jarak antara CustomElevatedButton dan RichText jika diperlukan
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account? ",
                  style: CustomTextStyles.titleSmallBlack900_1,
                ),
                TextSpan(
                  text: "Login",
                  style: CustomTextStyles.titleSmallBlack900Bold,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
