import 'package:flutter/material.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColors = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorSchemes = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the `LightCodeColors` for the current theme.
  LightCodeColors themeColor() {
    return _supportedCustomColors[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current `ThemeData` for the selected theme.
  ThemeData themeData() {
    final colorScheme = _supportedColorSchemes[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.purple50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
          side: BorderSide(
            color: colorScheme.onPrimary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
      ),

      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray4007f.withOpacity(0.6),
      ),
    );
  }
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF362C62),
    primaryContainer: Color(0XFFFF9CBD),
    errorContainer: Color(0XFFF21C1C),
    onError: Color(0XFF263238),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF1E1E1E),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amberA200 => Color(0XFFF8DE40);

  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color(0XFF8E8E8E);
  Color get blueGray700 => Color(0XFF455A64);
  Color get blueGray800 => Color(0XFF37474F);
  Color get blueGray900 => Color(0XFF2C2C2C);
  Color get blueGray90001 => Color(0XFF1B1A55);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFC4C0);
  Color get deepOrange200 => Color(0XFFFFA8A7);
  Color get deepOrange20001 => Color(0XFFFFBE9D);
  Color get deepOrange300 => Color(0XFFEB996E);
  Color get deepOrangeA100 => Color(0XFFEB9481);

  // DeepPurple
  Color get deepPurple400 => Color(0XFF7E60BF);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFF0F0F0);
  Color get gray20001 => Color(0XFFEBEBEB);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFDCDCDC);
  Color get gray30002 => Color(0XFFDDDDDD);
  Color get gray30003 => Color(0XFFDBDBDB);
  Color get gray400 => Color(0XFFCDC9B9);
  Color get gray40001 => Color(0XFFCBC6C6);
  Color get gray40002 => Color(0XFFCDCAB9);
  Color get gray40003 => Color(0XFFC7C7C7);
  Color get gray40004 => Color(0XFFCCC6C6);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray500 => Color(0XFFA6A6A6);
  Color get gray600 => Color(0XFF767676);
  Color get gray60001 => Color(0XFFAA6550);
  Color get gray800 => Color(0XFF3C3C43);

  // GrayF
  Color get gray4007f => Color(0X7FBABABA);

  // LightBlue
  Color get lightBlue400 => Color(0XFF26A9E0);

  // LightGreen
  Color get lightGreenA700 => Color(0XFF28DD00);

  // Lime
  Color get lime900 => Color(0XFF864E20);
  Color get lime90001 => Color(0XFF894536);

  // Purple
  Color get purple100 => Color(0XFFE4B1F0);
  Color get purple50 => Color(0XFFFFE1FF);

  // Red
  Color get red200 => Color(0XFFF28F8F);
  Color get red300 => Color(0XFFB78876);
  Color get red30001 => Color(0XFFD3766A);
  Color get red30002 => Color(0XFFAD6359);

  // RedF
  Color get red600F9 => Color(0XF9DC3545);

  // Yellow
  Color get yellow700 => Color(0XFFE7C930);
}
