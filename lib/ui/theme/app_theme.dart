import 'package:flcore/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

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
      scaffoldBackgroundColor: _lightColorScheme().background,
      textTheme: _baseTheme.textTheme.apply(
        bodyColor: _lightColorScheme().onBackground,
        displayColor: _lightColorScheme().onBackground,
      ),
      iconTheme: _baseTheme.iconTheme.copyWith(
        color: _lightColorScheme().onBackground,
      ),
    );
  }

  static ColorScheme _lightColorScheme() => ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.emerald,
        onPrimary: Colors.white,
        secondary: AppColors.mint,
        onSecondary: Colors.white,
        tertiary: Colors.grey[100]!,
        onTertiary: Colors.grey[900]!,
        background: Colors.white,
        onBackground: Colors.grey[900]!,
        surface: Colors.grey[100]!,
        onSurface: Colors.grey[900]!,
        error: Colors.red[400]!,
        onError: Colors.white,
      );

  static double get spacingSmall => 8;

  static double get spacing => 15;

  static double get spacingLarge => 30;

  static double get paddingSmall => 8;

  static double get padding => 15;

  static double get paddingLarge => 30;

  static double get borderRadius => 5;
}
