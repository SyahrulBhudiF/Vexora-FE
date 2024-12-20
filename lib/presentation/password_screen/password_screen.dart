import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexora_fe/blocs/password/password_bloc.dart';
import 'package:vexora_fe/blocs/password/password_event.dart';
import 'package:vexora_fe/blocs/password/password_state.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/data/models/dto/Request/change_password_dto.dart';
import 'package:vexora_fe/widget/app_bar/custom_app_bar.dart';
import 'package:vexora_fe/widget/custom_elevated_button.dart';
import 'package:vexora_fe/widget/custom_text_form_field.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController previousPasswordInputController =
      TextEditingController();
  final TextEditingController newPasswordInputController =
      TextEditingController();

  bool _isObscured = true;

  bool _isOpened = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: _buildPasswordBody(context),
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
    return Form(
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
        ],
      ),
    );
  }

  Widget _buildPreviousPasswordInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CustomTextFormField(
        controller: previousPasswordInputController,
        fillColor: Colors.white,
        hintText: "Enter your previous password",
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

  Widget _buildNewPasswordInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CustomTextFormField(
        controller: newPasswordInputController,
        fillColor: Colors.white,
        hintText: "Enter your new password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: _isOpened,
        suffix: GestureDetector(
          onTap: () => setState(() => _isOpened = !_isOpened),
          child: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.h, 30.h, 16.h),
            child: CustomImageView(
              imagePath: ImageConstant.visiblePassword,
              height: 24.h,
              width: 24.h,
              fit: BoxFit.contain,
              color:
                  _isOpened ? Colors.grey : Colors.deepPurple, // Warna dinamis
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

  Widget _buildSaveButton(BuildContext context) {
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is PasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PasswordLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return CustomElevatedButton(
          text: "Save",
          margin: EdgeInsets.symmetric(horizontal: 6.h),
          buttonStyle: CustomButtonStyles.fillPrimary,
          onPressed: () {
            context.read<PasswordBloc>().add(
                  ChangePasswordEvent(
                    changePasswordDto: ChangePasswordDto(
                      previous_password: previousPasswordInputController.text,
                      new_password: newPasswordInputController.text,
                    ),
                  ),
                );
          },
        );
      },
    );
  }
}
