import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/history/presentation/models/transaction_ui_model.dart';
import 'package:fondos/features/history/presentation/widget/empty_state_view.dart';
import 'package:fondos/features/history/presentation/widget/transaction_item_view.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionUiModel(
        title: 'Fondo Global Equity ESG',
        subtitle: 'Subscripción • 24 Oct 2023, 14:30',
        amount: '+\$2,500.00',
        isPositive: true,
      ),
      TransactionUiModel(
        title: 'Mercado Monetario Ultra',
        subtitle: 'Cancelación • 22 Oct 2023, 09:15',
        amount: '-\$850.40',
        isPositive: false,
      ),
      TransactionUiModel(
        title: 'Tecnología Emergente',
        subtitle: 'Subscripción • 18 Oct 2023, 16:45',
        amount: '+\$1,200.00',
        isPositive: true,
      ),
      TransactionUiModel(
        title: 'Renta Fija Corto Plazo',
        subtitle: 'Subscripción • 15 Oct 2023, 11:20',
        amount: '+\$4,000.00',
        isPositive: true,
      ),
    ];

    if (transactions.isEmpty) return const EmptyStateView();

    return Column(
      children: transactions
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: TransactionItemView(transaction: e),
            ),
          )
          .toList(),
    );
  }
}
