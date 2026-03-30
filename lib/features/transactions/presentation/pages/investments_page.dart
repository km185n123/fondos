import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_state.dart';
import 'package:fondos/features/transactions/presentation/widgets/investment_card_view.dart';
import 'package:fondos/l10n/app_localizations.dart';

class InvestmentsPage extends StatefulWidget {
  const InvestmentsPage({super.key});

  @override
  State<InvestmentsPage> createState() => _InvestmentsPageState();
}

class _InvestmentsPageState extends State<InvestmentsPage> {
  @override
  void initState() {
    super.initState();
    context.read<InvestmentsBloc>().add(const InvestmentsEvent.startWatching());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<InvestmentsBloc, InvestmentsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success: (investments, saldoActual) {
              if (investments.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.no_investments),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: investments.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSpacing.lg),
                itemBuilder: (_, i) =>
                    InvestmentCardView(transaction: investments[i]),
              );
            },
          );
        },
      ),
    );
  }
}
