import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlTheme {
  FlTheme({
    final String? fontFamily,
    this.primaryColor = Colors.green,
    this.secondaryColor = Colors.lime,
    this.tertiaryColor = Colors.orange,
  }) {
    _baseTheme = ThemeData(
      fontFamily: fontFamily ?? GoogleFonts.poppins().fontFamily,
      iconTheme: const IconThemeData(
        size: 24,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  late final ThemeData _baseTheme;

  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  ThemeData lightTheme() {
    final ColorScheme colorScheme = _lightColorScheme();
    return _baseTheme.copyWith(
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }

  ThemeData darkTheme() {
    final ColorScheme colorScheme = _darkColorScheme();
    return _baseTheme.copyWith(
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }

  ColorScheme _lightColorScheme() => ColorScheme.light(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: secondaryColor,
        onSecondary: Colors.white,
        tertiary: tertiaryColor,
        onTertiary: Colors.white,
        surface: Colors.white,
        surfaceContainer: Colors.grey[200]!,
        onSurface: Colors.grey[900]!,
        error: Colors.red[400]!,
        onError: Colors.white,
      );

  ColorScheme _darkColorScheme() => ColorScheme.dark(
        brightness: Brightness.dark,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: secondaryColor,
        onSecondary: Colors.white,
        tertiary: tertiaryColor,
        onTertiary: Colors.white,
        surface: Colors.grey[900]!,
        surfaceContainer: Colors.grey[800]!,
        onSurface: Colors.grey[100]!,
        error: Colors.red[400]!,
        onError: Colors.white,
      );

  // Spacing
  static const double spacingXs = 5;
  static const double spacingSm = 10;
  static const double spacingMd = 15; // Default spacing
  static const double spacingLg = 20;
  static const double spacingXl = 25;

  // Padding
  static const double paddingXs = 3;
  static const double paddingSm = 8;
  static const double paddingMd = 15; // Default padding
  static const double paddingLg = 20;
  static const double paddingXl = 25;

  // Border Radius
  static const double borderRadiusMd = 5; // Default border radius
  static const double borderRadiusLg = 10;
  static const double borderRadiusXl = 15;
  static const double borderRadiusXxl = 25;
}
