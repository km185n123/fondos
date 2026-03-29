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
import 'package:intl/intl.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  final _controller = TextEditingController();

  // Only responsible for formatting: strips non-digits, formats thousands.
  // Does NOT hold any business-rule logic.
  final _numberFormat = NumberFormat('#,##0', 'es_CO');

  // Formatter used only for display labels (available balance, etc.)
  final _currencyFormat = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  void _onAmountChanged(String raw) {
    // Strip everything that is not a digit
    final digitsOnly = raw.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      // Keep controller cleared without triggering another onChanged
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
    // Format with thousands separator, but NO currency symbol –
    // the $ lives in InputDecoration.prefixText so it never moves.
    final formatted = _numberFormat.format(amount);

    _controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    // Delegate ALL validation/business logic to the bloc
    context.read<SubscriptionBloc>().add(
      SubscriptionEvent.changeAmount(amount),
    );
  }

  void _onConfirm() {
    // The bloc holds all guards; view just fires the event.
    context.read<SubscriptionBloc>().add(const SubscriptionEvent.confirm());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  // SOLO build() modificado

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          bottom: MediaQuery.of(context).viewInsets.bottom, // 👈 teclado
        ),
        child: BlocConsumer<SubscriptionBloc, SubscriptionState>(
          listener: (context, state) {
            if (state.status == SubscriptionStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Suscripción exitosa')),
              );
              Navigator.of(context).pop(); // 👈 cerrar bottomsheet
            } else if (state.status == SubscriptionStatus.error &&
                state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min, // 👈 clave
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// drag handle
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
                  label: 'Monto a invertir',
                  hint: '0',
                  prefixSymbol: '\$',
                  error: state.amountError,
                  onChanged: _onAmountChanged,
                  trailing: Text(
                    'Disponible: ${_currencyFormat.format(state.availableBalance)}',
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
                      ? 'Procesando...'
                      : 'Suscribirse',
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
