import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/history/presentation/bloc/history_bloc.dart';
import 'package:fondos/features/history/presentation/models/transaction_ui_model.dart';
import 'package:fondos/features/history/presentation/widget/empty_state_view.dart';
import 'package:fondos/features/history/presentation/widget/transaction_item_view.dart';
import 'package:fondos/l10n/app_localizations.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) =>
              Center(child: Text(AppLocalizations.of(context)!.error)),
          success: (history) {
            if (history.isEmpty) return const EmptyStateView();

            return Column(
              children: history.reversed
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: TransactionItemView(
                        transaction: TransactionUiModel(
                          title: e.title,
                          amount: e.amount,
                          isPositive: e.isPositive,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}
