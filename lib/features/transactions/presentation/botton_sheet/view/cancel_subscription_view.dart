import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CancelSubscriptionView extends StatelessWidget {
  final Transaction transaction;

  const CancelSubscriptionView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvestmentsBloc>();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning, size: 48, color: AppColors.error),
          const SizedBox(height: AppSpacing.lg),

          Text(AppLocalizations.of(context)!.confirm_cancellation),
          const SizedBox(height: AppSpacing.sm),

          Text(AppLocalizations.of(context)!.cancellation_warning),

          const SizedBox(height: AppSpacing.lg),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                bloc.add(InvestmentsEvent.cancel(transaction));
                context.pop(true);
              },
              child: Text(AppLocalizations.of(context)!.yes_cancel),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.pop(false),
              child: Text(AppLocalizations.of(context)!.keep_investment),
            ),
          ),
        ],
      ),
    );
  }
}
