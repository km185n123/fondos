import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_state.dart';
import 'package:fondos/core/design_system/components/app_button_primary.dart';
import 'package:fondos/core/design_system/components/app_input.dart';
import 'package:fondos/features/transactions/presentation/widgets/fund_header_view.dart';
import 'package:fondos/features/transactions/presentation/widgets/notification_selector_view.dart';
import 'package:intl/intl.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  final _controller = TextEditingController();

  final double available = 12450000;

  final currency = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  String? localError;

  void onAmountChanged(String value) {
    final numeric = value.replaceAll(RegExp(r'[^0-9]'), '');
    final amount = double.tryParse(numeric) ?? 0;

    final formatted = currency.format(amount);

    _controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    if (amount > available) {
      setState(() {
        localError = 'Saldo insuficiente';
      });
    } else {
      setState(() {
        localError = null;
      });
    }

    context.read<SubscriptionBloc>().add(
      SubscriptionEvent.changeAmount(amount),
    );
  }

  void onConfirm() {
    if (localError != null || _controller.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Corrige los errores')));
      return;
    }

    context.read<SubscriptionBloc>().add(const SubscriptionEvent.confirm());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: const Text('Suscripción', style: AppTypography.headlineMedium),
      ),
      body: BlocConsumer<SubscriptionBloc, SubscriptionState>(
        listener: (context, state) {
          if (state.status == SubscriptionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Suscripción exitosa')),
            );
            Navigator.of(context).pop(); // Close the bottom sheet
          } else if (state.status == SubscriptionStatus.error &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.selectedFund != null)
                  FundHeaderView(fund: state.selectedFund!),
                const SizedBox(height: AppSpacing.lg),
                AppInput(
                  controller: _controller,
                  label: 'Monto a invertir',
                  hint: '\$ 0',
                  error:
                      localError, // Prioritize local error for "Saldo insuficiente"
                  onChanged: onAmountChanged,
                  trailing: Text(
                    'Disponible: ${currency.format(available)}',
                    style: AppTypography.label.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                NotificationSelectorView(
                  selected:
                      state.notificationMethod ?? NotificationMethod.email,
                  onChanged: (v) {
                    context.read<SubscriptionBloc>().add(
                      SubscriptionEvent.changeNotificationMethod(v),
                    );
                  },
                ),
                const Spacer(),
                AppButtonPrimary(
                  text: state.status == SubscriptionStatus.loading
                      ? 'Procesando...'
                      : 'Suscribirse',
                  onPressed: state.status == SubscriptionStatus.loading
                      ? () {}
                      : onConfirm,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
