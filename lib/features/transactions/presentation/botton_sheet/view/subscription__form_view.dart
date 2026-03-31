import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/components/app_button_primary.dart';
import 'package:fondos/core/design_system/components/app_input.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/enum/subscription_status.dart';
import 'package:fondos/core/formatters/amount_input_formatter.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_state.dart';
import 'package:fondos/features/transactions/presentation/widgets/fund_header_view.dart';
import 'package:fondos/features/transactions/presentation/widgets/notification_selector_view.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SubscriptionFormView extends StatelessWidget {
  const SubscriptionFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<SubscriptionBloc, SubscriptionState>(
        listener: (context, state) {
          final l10n = AppLocalizations.of(context)!;

          if (state.status == SubscriptionStatus.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l10n.subscription_success)));
            context.pop(true);
          } else if (state.status == SubscriptionStatus.error &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: AppSpacing.lg,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              SizedBox(height: AppSpacing.lg),
              _AmountInput(),
              SizedBox(height: AppSpacing.lg),
              _NotificationSelector(),
              SizedBox(height: AppSpacing.lg),
              _SubmitButton(),
              SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final fund = context.select(
      (SubscriptionBloc bloc) => bloc.state.selectedFund,
    );

    if (fund == null) return const SizedBox.shrink();

    return FundHeaderView(fund: fund);
  }
}

class _AmountInput extends StatefulWidget {
  const _AmountInput();

  @override
  State<_AmountInput> createState() => _AmountInputState();
}

class _AmountInputState extends State<_AmountInput> {
  final _controller = TextEditingController();
  final _numberFormat = NumberFormat('#,##0', 'es_CO');
  final _currencyFormat = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  double _parse(String value) {
    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(digits) ?? 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SubscriptionBloc>().state;
    final l10n = AppLocalizations.of(context)!;

    return AppInput(
      controller: _controller,
      label: l10n.amount_to_invest,
      hint: '0',
      prefixSymbol: '\$',
      keyboardType: TextInputType.number,
      inputFormatters: [AmountInputFormatter(_numberFormat)],
      error: state.amountError,
      onChanged: (value) {
        context.read<SubscriptionBloc>().add(
          SubscriptionEvent.changeAmount(_parse(value)),
        );
      },
      trailing: Text(
        l10n.available(_currencyFormat.format(state.availableBalance)),
      ),
    );
  }
}

class _NotificationSelector extends StatelessWidget {
  const _NotificationSelector();

  @override
  Widget build(BuildContext context) {
    final method = context.select(
      (SubscriptionBloc bloc) => bloc.state.notificationMethod,
    );

    return NotificationSelectorView(
      selected: method,
      onChanged: (m) {
        context.read<SubscriptionBloc>().add(
          SubscriptionEvent.changeNotificationMethod(m),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final status = context.select((SubscriptionBloc bloc) => bloc.state.status);

    final l10n = AppLocalizations.of(context)!;

    return AppButtonPrimary(
      text: status == SubscriptionStatus.loading
          ? l10n.processing
          : l10n.subscribe,
      onPressed: status == SubscriptionStatus.loading
          ? null
          : () {
              context.read<SubscriptionBloc>().add(
                const SubscriptionEvent.confirm(),
              );
            },
    );
  }
}
