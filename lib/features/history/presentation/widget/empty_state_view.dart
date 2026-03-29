import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.surfaceLow,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.history_toggle_off),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text(
          'No hay transacciones registradas',
          style: AppTypography.headlineMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Tus movimientos financieros aparecerán aquí.',
          style: AppTypography.body,
        ),
      ],
    );
  }
}
