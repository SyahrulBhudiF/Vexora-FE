import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vexora_fe/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get dark =>
      BoxDecoration(color: theme.colorScheme.primary);

  static BoxDecoration get dropShadow400 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(color: appTheme.blueGray100, width: 1.h),
      );
  // fill decoration
  static BoxDecoration get fillBlack =>
      BoxDecoration(color: appTheme.black900.withOpacity(0.45));
  static BoxDecoration get fillGray =>
      BoxDecoration(color: appTheme.gray30003.withOpacity(0.29));
  static BoxDecoration get fillGray30003 =>
      BoxDecoration(color: appTheme.gray30003.withOpacity(0.31));
  static BoxDecoration get fillGray50 => BoxDecoration(color: appTheme.gray50);
  static BoxDecoration get fillOnPrimary =>
      BoxDecoration(color: theme.colorScheme.onPrimary);

  // Gradient decorations
  static BoxDecoration get gradienPrimaryToPurple => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 0.89),
          colors: [theme.colorScheme.primary, appTheme.purple100],
        ),
      );
  // Medium decorations
  static BoxDecoration get medium =>
      BoxDecoration(color: appTheme.deepPurple400);

  // ouline decorations
  static BoxDecoration get outlineGray400f => BoxDecoration(
      color: theme.colorScheme.onPrimary,
      border: Border(
        top: BorderSide(
          color: appTheme.gray4007f,
          width: 1.h,
        ),
      ));
  static BoxDecoration get outlineGrayF =>
      BoxDecoration(color: theme.colorScheme.onPrimary, boxShadow: [
        BoxShadow(
          color: appTheme.gray4007f.withOpacity(0.25),
          spreadRadius: 2.h,
          blurRadius: 2.h,
          offset: Offset(0, 4),
        )
      ]);
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(color: theme.colorScheme.onPrimary, width: 1.h),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration();
}

class BorderRadiusStyle {
  static BorderRadius get customBorder42 => BorderRadius.circular(42.h);
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );
  static BorderRadius get customBorderTL40 => BorderRadius.only(
        topLeft: Radius.circular(40.h),
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(12.h);
  static BorderRadius get roundedBorder26 => BorderRadius.circular(26.h);
  static BorderRadius get roundedBorder32 => BorderRadius.circular(32.h);
  static BorderRadius get roundedBorder4 => BorderRadius.circular(4.h);
  static BorderRadius get roundedBorder50 => BorderRadius.circular(50.h);
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h);
}
