import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.show_chart, size: 64, color: AppColors.primary),
            SizedBox(height: AppSpacing.md),
            Text(
              'My Investments',
              style: AppTypography.headlineMedium,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Próximamente verás aquí tus fondos activos.',
              style: AppTypography.body,
            ),
          ],
        ),
      ),
    );
  }
}
