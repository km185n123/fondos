import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class FundHeaderView extends StatelessWidget {
  final Fund fund;

  const FundHeaderView({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'es_CO',
      symbol: '\$',
      decimalDigits: 0,
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.selected_fund,
            style: AppTypography.label,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(fund.name, style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppLocalizations.of(context)!.category(fund.category),
            style: AppTypography.body.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            AppLocalizations.of(
              context,
            )!.min_amount(currency.format(fund.minimumAmount)),
            style: AppTypography.body.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
