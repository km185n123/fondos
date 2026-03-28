import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fondos/core/di/injection.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/widgets/subscription_view.dart';

class SubscriptionPage extends StatelessWidget {
  final Fund fund;

  const SubscriptionPage({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SubscriptionBloc>()..add(SubscriptionEvent.selectFund(fund)),
      child: const SubscriptionView(),
    );
  }
}
