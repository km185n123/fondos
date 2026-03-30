import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/history/presentation/models/transaction_ui_model.dart';

class TransactionItemView extends StatelessWidget {
  final TransactionUiModel transaction;

  const TransactionItemView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.isPositive;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT SIDE (flexible)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isPositive
                        ? AppColors.secondary.withValues(alpha: 0.2)
                        : AppColors.primaryContainer.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPositive ? Icons.add : Icons.remove,
                    color: isPositive ? AppColors.primary : Colors.red,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),

                /// TEXTS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.headlineMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: AppSpacing.md),

          /// RIGHT SIDE (fixed)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                transaction.amount,
                style: AppTypography.headlineMedium.copyWith(
                  color: isPositive ? AppColors.primary : Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'COMPLETADO',
                style: AppTypography.label.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
