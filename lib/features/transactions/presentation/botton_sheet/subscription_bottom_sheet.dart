import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/botton_sheet/bottom_sheet_container.dart';
import 'package:fondos/features/transactions/presentation/botton_sheet/view/subscription__form_view.dart';

Future<void> showSubscriptionBottomSheet(BuildContext context, Fund fund) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) =>
            getIt<SubscriptionBloc>()..add(SubscriptionEvent.selectFund(fund)),
        child: const BottomSheetContainer(child: SubscriptionFormView()),
      );
    },
  );
}
