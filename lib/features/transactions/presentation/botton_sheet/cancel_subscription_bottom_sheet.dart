import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/features/transactions/presentation/botton_sheet/bottom_sheet_container.dart';
import 'package:fondos/features/transactions/presentation/botton_sheet/view/cancel_subscription_view.dart';

Future<void> cancelSubscriptionBottomSheet(
  BuildContext context,
  Transaction transaction,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) =>
            getIt<InvestmentsBloc>()..add(InvestmentsEvent.cancel(transaction)),
        child: BottomSheetContainer(
          child: CancelSubscriptionView(transaction: transaction),
        ),
      );
    },
  );
}
