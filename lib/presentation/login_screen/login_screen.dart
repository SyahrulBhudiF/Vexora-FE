import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_event.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import 'package:vexora_fe/data/models/dto/Request/login_dto.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import '../../core/app_export.dart';
import '../../widget/app_bar/appbar_leading_image.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import '../../widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordtwoController = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.deepPurple400,
        appBar: _buildAppBar(context),
        body: Form(
          // key: formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 38.h),
                    _buildHeaderSection(context),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 784.h,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.h, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: appTheme.gray50,
                              borderRadius: BorderRadiusStyle.customBorderTL32,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                Text(
                                  "Sign In",
                                  style: theme.textTheme.headlineSmall,
                                ),
                                Text(
                                  "Welcome back !",
                                  style: CustomTextStyles.titleLargeBlack900,
                                ),
                                Text(
                                  "Hello there, sign in to continue",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                                SizedBox(height: 16.h),
                                _buildLoginForm(context),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.h),
                                    child: Text(
                                      "Forgot Password?",
                                      style:
                                          CustomTextStyles.titleSmallBlack900_2,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60.h),
                                BlocConsumer<AuthBloc, AuthState>(
                                  listener: (context, state) {
                                    if (state is AuthSuccess) {
                                      Navigator.pushNamed(
                                          context, AppRoutes.homepageInitial);
                                    }

                                    if (state is AuthFailure) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is AuthLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return CustomElevatedButton(
                                      text: "Login Account",
                                      buttonStyle:
                                          CustomButtonStyles.fillDeepPurple,
                                      onPressed: () {
                                        context.read<AuthBloc>().add(
                                              AuthLoginEvent(
                                                  loginDto: LoginDto(
                                                      username:
                                                          userNameController
                                                              .text,
                                                      password:
                                                          passwordtwoController
                                                              .text)),
                                            );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Don't have an account? ",
                                          style: CustomTextStyles
                                              .titleSmallBlack900_1,
                                        ),
                                        TextSpan(
                                            text: "Sign Up",
                                            style: CustomTextStyles
                                                .titleSmallBlack900Bold,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.register);
                                              })
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 148.h,
                                    child: Divider(
                                      color: appTheme.black900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [_buildIllustrationSection(context)],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 50.h,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.arrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 20.h),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.register);
        },
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 22.h,
        right: 16.h,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 150.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 46.h,
                  width: 50.h,
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.smallLogo2,
                        height: 40.h,
                        width: 34.h,
                        radius: BorderRadius.circular(8.h),
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.h),
                Text(
                  "Vexora",
                  style: CustomTextStyles.titleLargeBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 4.h),
          CustomTextFormField(
            controller: userNameController,
            fillColor: Colors.white,
            hintText: "Enter your username",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 16.h,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            "Password",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.h),
          CustomTextFormField(
            controller: passwordtwoController,
            fillColor: Colors.white,
            hintText: "Enter your password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
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
            obscureText: true,
            contentPadding: EdgeInsets.fromLTRB(12.h, 16.h, 30.h, 16.h),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrationSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imageLogin,
              height: 232.h,
              width: 350.h,
            ),
          ],
        ),
      ),
    );
  }
}
