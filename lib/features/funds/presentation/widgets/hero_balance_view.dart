import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class HeroBalanceView extends StatelessWidget {
  const HeroBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total portfolio balance',
          style: AppTypography.label.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: 8),
        const Text('COP 500.000', style: AppTypography.headlineLarge),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.trending_up, size: 16, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              '+2.4% this month',
              style: AppTypography.label.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
