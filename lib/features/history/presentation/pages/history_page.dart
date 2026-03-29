import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/history/presentation/widget/app_section_label.dart';
import 'package:fondos/features/history/presentation/widget/transaction_list_view.dart';
import 'package:fondos/features/history/presentation/widget/search_bar_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(AppSpacing.lg, 60, AppSpacing.lg, AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarView(),
          SizedBox(height: AppSpacing.lg),
          AppSectionLabel(label: 'Transacciones'),
          SizedBox(height: AppSpacing.md),
          TransactionListView(),
        ],
      ),
    );
  }
}
