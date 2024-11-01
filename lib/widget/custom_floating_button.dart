import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_export.dart';
import '../core/theme/custom_button_style.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton(
      {Key? key,
      this.alignment,
      this.backgroundColor,
      this.onTap,
      this.shape,
      this.width,
      this.height,
      this.decoration,
      this.child})
      : super(key: key);

  final Alignment? alignment;
  final Color? backgroundColor;
  final VoidCallBack? onTap;
  final ShapeBorder? shape;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Widget? child;

  @override
  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(36.h),
              ),
          child: child,
        ),
      );
}
