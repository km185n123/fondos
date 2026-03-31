import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class AppButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButtonPrimary({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTypography.body.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
