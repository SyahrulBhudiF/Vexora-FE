import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/blocs/password/password_bloc.dart';
import 'package:vexora_fe/blocs/password/password_event.dart';
import 'package:vexora_fe/blocs/password/password_state.dart';
import 'package:vexora_fe/controller/change_password_controller.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import 'package:vexora_fe/widget/custom_text_form_field.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final TextEditingController previousPasswordInputController = TextEditingController();
  final TextEditingController newPasswordInputController = TextEditingController();
  final TextEditingController confirmPasswordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordBloc(
        passwordController: ChangePasswordController(),
      ),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: theme.colorScheme.onPrimary,
              resizeToAvoidBottomInset: false,
              appBar: _buildAppBar(context),
              body: _buildPasswordBody(context),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.h,
      leadingWidth: 48.h,
      leading: CustomImageView(
        color: Colors.black,
        imagePath: ImageConstant.arrowLeft,
        margin: EdgeInsets.only(left: 24.h, top: 20.h),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildPasswordBody(BuildContext context) {
    return BlocListener<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is PasswordLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing...')),
          );
        } else if (state is PasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          Navigator.pop(context);
        } else if (state is PasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Form(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Change your password",
                style: CustomTextStyles.titleMediumSemiBold,
              ),
              SizedBox(
                width: 236.h,
                child: Text(
                  "Enter a new password below to change your password",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 28.h),
              _buildPasswordFieldSection(context),
              SizedBox(height: 68.h),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordFieldSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Previous Password",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildPreviousPasswordInput(context),
          SizedBox(height: 18.h),
          Text(
            "New Password",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          _buildNewPasswordInput(context),
          SizedBox(height: 18.h),
          Text(
            "Confirm Password",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.h),
          _buildConfirmPasswordInput(context)
        ],
      ),
    );
  }

  Widget _buildPreviousPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: previousPasswordInputController,
        fillColor: Colors.white,
        hintText: "Enter your previous password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildNewPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: newPasswordInputController,
        fillColor: Colors.white,
        hintText: "Enter your new password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: CustomTextFormField(
        controller: confirmPasswordInputController,
        fillColor: Colors.white,
        hintText: "Confirm your new password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Save",
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      onPressed: () {
        final previousPassword = previousPasswordInputController.text;
        final newPassword = newPasswordInputController.text;
        final confirmPassword = confirmPasswordInputController.text;

        if (newPassword != confirmPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New passwords do not match!')),
          );
          return;
        }

        // Trigger Bloc Event
        context.read<PasswordBloc>().add(
              ChangePasswordEvent(
                changePasswordDto: ChangePasswordDto(
                  current_password: previousPassword,
                  new_password: newPassword,
                ),
              ),
            );
      },
    );
  }
}
