import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class AppSectionLabel extends StatelessWidget {
  const AppSectionLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTypography.label.copyWith(
        color: AppColors.secondary.withValues(alpha: 0.7),
      ),
    );
  }
}
