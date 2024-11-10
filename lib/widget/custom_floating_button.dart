import 'package:flutter/material.dart';
import '../core/app_export.dart';

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
  final VoidCallback? onTap;
  final ShapeBorder? shape;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: fabWidget)
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.h)),
        child: Container(
          alignment: Alignment.center,
          width: width ?? 56.0, // Set a minimum width
          height: height ?? 56.0, // Set a minimum height
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(36.h),
              ),
          child: CustomImageView(
            imagePath: ImageConstant.imgCamera,
            width: 20.h,
            height: 20.h,
            fit: BoxFit.contain, // Ensure the image fits well
          ),
        ),
      );
}
