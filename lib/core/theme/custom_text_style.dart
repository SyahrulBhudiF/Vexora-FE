import 'package:flutter/material.dart';
import 'theme_helper.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

class CustomTextStyles {
  // Body text styles
  static TextStyle get bodyLargeGray100 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray100,
      );

  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  // Headline text styles
  static TextStyle get headlineSmallInterOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        fontFamily: 'Inter', // Assuming 'Inter' font as per `inter.copyWith`
        color: theme.colorScheme.onPrimaryContainer,
      );

  static TextStyle get headlineSmallOnPrimary =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );

  // Label text styles
  static TextStyle get labelLargeBlack900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelLargeBlack900Medium =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelLargeBlack900_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelLargePurple50 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.purple50,
      );

  static TextStyle get labelMediumOnPrimary =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumOnPrimary_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get labelMediumSemiBold =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  // Title text styles
  static TextStyle get titleLargeBlack900 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumBlack900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleLargeSemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumBluegray90001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumGray40001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray40001,
      );

  static TextStyle get titleMediumOnPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMediumOnPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallBlack900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.2),
      );

  static TextStyle get titleSmallBlack900Bold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallBlack900_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get titleSmallBlack900_2 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.7),
      );

  static TextStyle get titleSmallBlack900_3 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get titleSmallGray40002 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray40002,
      );

  static TextStyle get titleSmallGray40003 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray40003,
      );

  static TextStyle get titleSmallGray50 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w600,
      );
}
