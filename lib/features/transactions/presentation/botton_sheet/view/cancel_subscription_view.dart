import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';

class CancelSubscriptionView extends StatelessWidget {
  final Transaction transaction;

  const CancelSubscriptionView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SubscriptionBloc>();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning, size: 48, color: Colors.red),
          const SizedBox(height: 16),

          const Text('¿Confirmar cancelación?'),
          const SizedBox(height: 12),

          const Text('El proceso puede tardar 48h'),

          const SizedBox(height: 24),

          /// CONFIRM
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                bloc.add(SubscriptionEvent.cancel(transaction));
                Navigator.pop(context);
              },
              child: const Text('Sí, cancelar'),
            ),
          ),

          const SizedBox(height: 12),

          /// CANCEL
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Mantener inversión'),
            ),
          ),
        ],
      ),
    );
  }
}

/*
/// ----------------------------
/// CANCEL MODAL
/// ----------------------------
Future<void> showCancelBottomSheet(BuildContext context, String fundName) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              '¿Confirmar cancelación?',
              style: AppTypography.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Vas a cancelar $fundName.\nEl proceso puede tardar 48h.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            /// ACTIONS
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Sí, cancelar'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Mantener inversión'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}*/
