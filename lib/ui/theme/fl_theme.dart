import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlTheme {
  const FlTheme({
    this.primaryColor = Colors.green,
    this.secondaryColor = Colors.lime,
  });

  final Color primaryColor;
  final Color secondaryColor;

  static final ThemeData _baseTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
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
        tertiary: Colors.grey[100]!,
        onTertiary: Colors.grey[900]!,
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
        tertiary: Colors.grey[900]!,
        onTertiary: Colors.grey[100]!,
        surface: Colors.grey[900]!,
        surfaceContainer: Colors.grey[800]!,
        onSurface: Colors.grey[100]!,
        error: Colors.red[400]!,
        onError: Colors.white,
      );

  static const double spacingSm = 8;

  static const double spacing = 15;

  static const double spacingLg = 30;

  static const double paddingSm = 8;

  static const double padding = 15;

  static const double paddingLg = 30;

  static const double borderRadiusSm = 5;

  static const double borderRadius = 10;

  static const double borderRadiusLg = 15;

  static const double borderRadiusFull = double.infinity;
}
