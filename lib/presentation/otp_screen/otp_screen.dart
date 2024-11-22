import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_event.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import '../../core/app_export.dart';
import '../../data/models/dto/Request/verifyOtp_dto.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final TextEditingController otpInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    // If arguments is null, handle it by providing a default value or showing an error
    if (arguments == null || arguments is! Map) {
      // You can either throw an error, or provide a default empty Map or other value
      throw Exception("OTP screen requires arguments.");
    }

    // Now safely cast the arguments
    final Map<String, dynamic> args = arguments as Map<String, dynamic>;

    // Retrieve the email from arguments
    final String email = args['email'];
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          child: Form(
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
                                      "Verifikasi Kode OTP",
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                  ),
                                  SizedBox(height: 18.h),
                                  _buildOtpForm(context, email),
                                  SizedBox(height: 18.h),
                                  SizedBox(height: 54.h),
                                  _buildOtpButton(context),
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

  // /// Section Widget
  // Widget _buildOtpInput(BuildContext context) {
  //   return
  // }
  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: emailInputController,
        hintText: "Enter your Email",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildOtpInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: otpInputController,
        hintText: "Enter Otp Code",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildOtpForm(BuildContext context, String email) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Masukkan Email",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildEmailInput(context),
          SizedBox(height: 14.h),
          Text(
            "Masukkan Kode OTP",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildOtpInput(context),
          SizedBox(height: 14.h),
          GestureDetector(
            onTap: () {
              context.read<AuthBloc>().add(AuthSendOtpEvent(email));
            },
            child: Text(
              "Kirim Ulang Kode Otp",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOtpButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthOtpVerified) {
                Navigator.pushNamed(context, AppRoutes.login);
              }

              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomElevatedButton(
                text: "Send",
                margin: EdgeInsets.symmetric(horizontal: 6.h),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthVerifyOtpEvent(
                          verifyOtpDto: VerifyOtpDto(
                            email: emailInputController.text,
                            otp: otpInputController.text,
                          ),
                        ),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
