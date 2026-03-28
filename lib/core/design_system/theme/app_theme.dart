import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Inter',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(primary: AppColors.primary),
    );
  }
}
