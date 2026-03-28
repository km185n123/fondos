import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/widgets/app_button_primary.dart';
import 'package:fondos/features/transactions/presentation/widgets/app_input.dart';
import 'package:fondos/features/transactions/presentation/widgets/fund_header.dart';
import 'package:fondos/features/transactions/presentation/widgets/notification_selector.dart';
import 'package:intl/intl.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final _controller = TextEditingController();

  final double available = 12450000;
  final double minAmount = 500000;

  NotificationMethod method = NotificationMethod.email;
  String? error;

  final currency = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  void onAmountChanged(String value) {
    final numeric = value.replaceAll(RegExp(r'[^0-9]'), '');
    final amount = double.tryParse(numeric) ?? 0;

    final formatted = currency.format(amount);

    _controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );

    if (amount < minAmount) {
      error = 'Monto mínimo: $minAmount';
    } else if (amount > available) {
      error = 'Saldo insuficiente';
    } else {
      error = null;
    }

    setState(() {});
  }

  void onConfirm() {
    if (error != null || _controller.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Corrige los errores')));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Suscripción exitosa')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: const Text('Suscripción', style: AppTypography.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FundHeader(),
            const SizedBox(height: AppSpacing.lg),
            AppInput(
              controller: _controller,
              label: 'Monto a invertir',
              hint: '\$ 0',
              error: error,
              onChanged: onAmountChanged,
              trailing: Text(
                'Disponible: ${currency.format(available)}',
                style: AppTypography.label.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            NotificationSelector(
              selected: method,
              onChanged: (v) => setState(() => method = v),
            ),
            const Spacer(),
            AppButtonPrimary(text: 'Suscribirse', onPressed: onConfirm),
          ],
        ),
      ),
    );
  }
}
