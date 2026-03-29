import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/widgets/subscription_view.dart';

Future<void> showSubscriptionBottomSheet(BuildContext context, Fund fund) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 👈 clave para full height
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) =>
            getIt<SubscriptionBloc>()..add(SubscriptionEvent.selectFund(fund)),
        child: const _BottomSheetContainer(),
      );
    },
  );
}

class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: const SubscriptionView(),
    );
  }
}
