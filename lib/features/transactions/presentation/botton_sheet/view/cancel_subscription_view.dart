import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/l10n/app_localizations.dart';

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
          const Icon(Icons.warning, size: 48, color: Colors.red),
          const SizedBox(height: 16),

          Text(AppLocalizations.of(context)!.confirm_cancellation),
          const SizedBox(height: 12),

          Text(AppLocalizations.of(context)!.cancellation_warning),

          const SizedBox(height: 24),

          /// CONFIRM
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                bloc.add(InvestmentsEvent.cancel(transaction));
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.yes_cancel),
            ),
          ),

          const SizedBox(height: 12),

          /// CANCEL
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)!.keep_investment),
            ),
          ),
        ],
      ),
    );
  }
}
