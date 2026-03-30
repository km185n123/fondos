import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
        BlocBuilder<FundBloc, FundState>(
          builder: (context, state) {
            final balance = state.maybeWhen(
              success: (_, balance) => balance,
              orElse: () => 500000.0,
            );
            return Text(
              'COP ${NumberFormat.decimalPattern('es_CO').format(balance)}',
              style: AppTypography.headlineLarge,
            );
          },
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.trending_up, size: 16, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              AppLocalizations.of(context)!.monthly_growth('2.4'),
              style: AppTypography.label.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
