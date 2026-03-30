import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/features/history/presentation/bloc/history_bloc.dart';
import 'package:fondos/features/history/presentation/widget/app_section_label.dart';
import 'package:fondos/features/history/presentation/widget/transaction_list_view.dart';
import 'package:fondos/features/history/presentation/widget/search_bar_view.dart';
import 'package:fondos/l10n/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HistoryBloc>()..add(const HistoryEvent.watchHistory()),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        60,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarView(),
          const SizedBox(height: AppSpacing.lg),
          AppSectionLabel(label: AppLocalizations.of(context)!.transactions),
          const SizedBox(height: AppSpacing.md),
          const TransactionListView(),
        ],
      ),
    );
  }
}
