import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/blocs/auth/auth_event.dart';
import 'package:vexora_fe/blocs/auth/auth_state.dart';
import '../../blocs/reset_password/resetpass_bloc.dart';
import '../../blocs/reset_password/resetpass_event.dart';
import '../../blocs/reset_password/resetpass_state.dart';
import '../../core/app_export.dart';
import '../../data/models/dto/Request/resetpass_dto.dart';
import '../../data/models/dto/Request/verifyOtp_dto.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController otpInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController newPassInputController = TextEditingController();

  bool _isObscured = true; // Deklarasi _isObscured di sini

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          child: Form(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 870,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imageRegister,
                        height: 166.h,
                        width: 252.h,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 130.h),
                      ),
                      _buildArrowNavigation(context),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(flex: 2),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 28),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Reset Password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  _buildOtpForm(context),
                                  const SizedBox(height: 18),
                                  const SizedBox(height: 54),
                                  _buildResetPasswordButton(context),
                                  const SizedBox(height: 24),
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
      margin: const EdgeInsets.symmetric(horizontal: 22),
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
                      padding: const EdgeInsets.only(left: 84),
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

  Widget _buildEmailInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: emailInputController,
        hintText: "Enter your Email",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }

  Widget _buildOtpInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CustomTextFormField(
        fillColor: Colors.white,
        controller: otpInputController,
        hintText: "Enter OTP Code",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }

  Widget _buildResetPasswordInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CustomTextFormField(
        controller: newPassInputController,
        fillColor: Colors.white,
        hintText: "Enter your password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: _isObscured,
        suffix: GestureDetector(
          onTap: () => setState(() => _isObscured = !_isObscured),
          child: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.h, 30.h, 16.h),
            child: CustomImageView(
              imagePath: ImageConstant.visiblePassword,
              height: 24.h,
              width: 24.h,
              fit: BoxFit.contain,
              color: _isObscured
                  ? Colors.grey
                  : Colors.deepPurple, // Warna dinamis
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 56.h,
        ),
        contentPadding: EdgeInsets.fromLTRB(12.h, 16.h, 30.h, 16.h),
      ),
    );
  }

  Widget _buildOtpForm(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Masukkan Email",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          _buildEmailInput(context),
          const SizedBox(height: 14),
          Text(
            "Masukkan Kode OTP",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          _buildOtpInput(context),
          const SizedBox(height: 14),
          Text(
            "Masukkan New Password",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          _buildResetPasswordInput(context),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              context
                  .read<AuthBloc>()
                  .add(AuthSendOtpEvent(emailInputController.text));
            },
            child: Text(
              "Kirim Kode OTP",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pushNamed(context, AppRoutes.login);
          }

          if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomElevatedButton(
            text: "Reset Password",
            margin: const EdgeInsets.symmetric(horizontal: 6),
            buttonStyle: CustomButtonStyles.fillPrimary,
            onPressed: () {
              context.read<ResetPasswordBloc>().add(
                    ResetPasswordRequested(
                      resetPasswordDto: ResetPasswordDto(
                        email: emailInputController.text,
                        otp: otpInputController.text,
                        newpassword: newPassInputController.text,
                      ),
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
