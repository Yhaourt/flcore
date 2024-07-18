import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlTheme {
  const FlTheme();

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

  static ThemeData lightTheme() {
    return _baseTheme.copyWith(
      brightness: _lightColorScheme().brightness,
      colorScheme: _lightColorScheme(),
      scaffoldBackgroundColor: Colors.grey[50],
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: _lightColorScheme().onSurface,
        displayColor: _lightColorScheme().onSurface,
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: _lightColorScheme().onSurface,
      ),
    );
  }

  static ThemeData darkTheme() {
    return _baseTheme.copyWith(
      brightness: _darkColorScheme().brightness,
      colorScheme: _darkColorScheme(),
      scaffoldBackgroundColor: _darkColorScheme().background,
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: _darkColorScheme().onSurface,
        displayColor: _darkColorScheme().onSurface,
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: _darkColorScheme().onSurface,
      ),
    );
  }

  static ColorScheme _lightColorScheme() => ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.green,
        onPrimary: Colors.white,
        secondary: Colors.lime,
        onSecondary: Colors.white,
        tertiary: Colors.grey[100]!,
        onTertiary: Colors.grey[900]!,
        surface: Colors.white,
        onSurface: Colors.grey[900]!,
        error: Colors.red[400]!,
        onError: Colors.white,
      );

  static ColorScheme _darkColorScheme() => ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.green,
        onPrimary: Colors.white,
        secondary: Colors.lime,
        onSecondary: Colors.white,
        tertiary: Colors.grey[900]!,
        onTertiary: Colors.grey[100]!,
        surface: Colors.grey[900]!,
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

  static const BoxShadow shadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    offset: Offset(0, 5),
  );
}
