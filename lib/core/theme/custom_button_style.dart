import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillDeepPurple => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurple400,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        elevation: 0,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        elevation: 0,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get fillPrimaryTL8 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
        elevation: 0,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineBlueGray => OutlinedButton.styleFrom(
        backgroundColor: appTheme.red600F9,
        side: Borderside(
          color: appTheme.blueGray900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
        backgroundColor: appTheme.gray20001,
        side: Borderside(
          color: appTheme.gray600,
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        side: WidgetStateProperty.all<BorderSide>(
            BorderSide(color: Colors.transparent)),
      );
}
