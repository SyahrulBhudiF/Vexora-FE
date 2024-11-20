import 'package:flutter/material.dart';
import 'package:vexora_fe/blocs/auth/auth_bloc.dart';
import 'package:vexora_fe/core/app_export.dart';
import 'package:vexora_fe/widget/custom_outlined_button.dart';

import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(right: 15.h, left: 15.h),
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 26.h,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadiusStyle.roundedBorder26,
            border: Border.all(
              color: appTheme.blueGray100,
              width: 1.h,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 2.h),
              Text(
                "Log Out",
                style: CustomTextStyles.headlineSmallInterOnPrimaryContainer,
              ),
              SizedBox(height: 6.h),
              Text(
                "Apakah Anda yakin ingin keluar?",
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomOutlinedButton(
                      width: 84.h,
                      text: "Kembali",
                      buttonStyle: CustomButtonStyles.outlineGray,
                      buttonTextStyle: theme.textTheme.bodyLarge!,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLogoutSuccess) {
                          Navigator.pushNamed(context, AppRoutes.login);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return CustomOutlinedButton(
                          width: 64.h,
                          text: "Yakin",
                          margin: EdgeInsets.only(left: 16.h),
                          buttonStyle: CustomButtonStyles.outlineBlueGray,
                          buttonTextStyle: CustomTextStyles.bodyLargeGray100,
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthLogoutEvent());
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
