import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_state.dart';
import 'package:fondos/core/design_system/components/app_button_primary.dart';
import 'package:fondos/core/design_system/components/app_input.dart';
import 'package:fondos/features/transactions/presentation/widgets/fund_header_view.dart';
import 'package:fondos/features/transactions/presentation/widgets/notification_selector_view.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class SubscriptionFormView extends StatefulWidget {
  const SubscriptionFormView({super.key});

  @override
  State<SubscriptionFormView> createState() => _SubscriptionFormViewState();
}

class _SubscriptionFormViewState extends State<SubscriptionFormView> {
  final _controller = TextEditingController();

  final _numberFormat = NumberFormat('#,##0', 'es_CO');

  final _currencyFormat = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  void _onAmountChanged(String raw) {
    final digitsOnly = raw.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      _controller.value = const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
      context.read<SubscriptionBloc>().add(
        const SubscriptionEvent.changeAmount(0),
      );
      return;
    }

    final amount = double.parse(digitsOnly);
    final formatted = _numberFormat.format(amount);

    _controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    context.read<SubscriptionBloc>().add(
      SubscriptionEvent.changeAmount(amount),
    );
  }

  void _onConfirm() {
    context.read<SubscriptionBloc>().add(const SubscriptionEvent.confirm());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _translateError(String? key, SubscriptionState state) {
    if (key == null) return null;
    final l10n = AppLocalizations.of(context)!;
    switch (key) {
      case 'insufficient_balance':
        return l10n.insufficient_balance;
      case 'select_fund_error':
        return l10n.select_fund_error;
      case 'notification_method_error':
        return l10n.notification_method_error;
      case 'min_amount_error':
        final minStr = _currencyFormat.format(
          state.selectedFund?.minimumAmount ?? 0,
        );
        return l10n.min_amount_error(minStr);
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<SubscriptionBloc, SubscriptionState>(
          listener: (context, state) {
            final l10n = AppLocalizations.of(context)!;
            if (state.status == SubscriptionStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.subscription_success)),
              );
              Navigator.of(context).pop();
            } else if (state.status == SubscriptionStatus.error &&
                state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _translateError(state.errorMessage!, state) ?? '',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final l10n = AppLocalizations.of(context)!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                if (state.selectedFund != null)
                  FundHeaderView(fund: state.selectedFund!),
                const SizedBox(height: AppSpacing.lg),
                AppInput(
                  controller: _controller,
                  label: l10n.amount_to_invest,
                  hint: '0',
                  prefixSymbol: '\$',
                  error: _translateError(state.amountError, state),
                  onChanged: _onAmountChanged,
                  trailing: Text(
                    l10n.available(
                      _currencyFormat.format(state.availableBalance),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                NotificationSelectorView(
                  selected:
                      state.notificationMethod ?? NotificationMethod.email,
                  onChanged: (method) {
                    context.read<SubscriptionBloc>().add(
                      SubscriptionEvent.changeNotificationMethod(method),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButtonPrimary(
                  text: state.status == SubscriptionStatus.loading
                      ? l10n.processing
                      : l10n.subscribe,
                  onPressed: state.status == SubscriptionStatus.loading
                      ? () {}
                      : _onConfirm,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
