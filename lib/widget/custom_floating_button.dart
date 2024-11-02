import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return fabWidget;
  }
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
