import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';

class AppTypography {
  static const headlineLarge = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static const headlineMedium = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const label = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
