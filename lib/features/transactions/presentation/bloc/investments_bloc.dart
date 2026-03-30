import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/usecases/cancel_investment_use_case.dart';
import 'package:fondos/features/transactions/domain/usecases/watch_investments_use_case.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class InvestmentsBloc extends Bloc<InvestmentsEvent, InvestmentsState> {
  final WatchInvestmentsUseCase watchInvestmentsUseCase;
  final CancelInvestmentUseCase cancelInvestmentUseCase;
  StreamSubscription? _subscription;

  InvestmentsBloc({
    required this.watchInvestmentsUseCase,
    required this.cancelInvestmentUseCase,
  }) : super(const InvestmentsState.initial()) {
    on<InvestmentsEvent>((event, emit) async {
      await event.when(
        cancel: (transaction) async => _onCancel(transaction, emit),
        startWatching: () async => _onStartWatching(emit),
        onData: (data) async => _onData(data, emit),
      );
    });
  }

  Future<void> _onStartWatching(Emitter<InvestmentsState> emit) async {
    emit(const InvestmentsState.loading());

    await _subscription?.cancel();

    _subscription = watchInvestmentsUseCase().listen(
      (data) {
        add(InvestmentsEvent.onData(data));
      },
      onError: (e) {
        emit(InvestmentsState.error(e.toString()));
      },
    );
  }

  void _onData(List<Transaction> data, Emitter<InvestmentsState> emit) {
    final total = data.fold<double>(0, (prev, e) => prev + e.amount);

    emit(InvestmentsState.success(investments: data, saldoActual: total));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> _onCancel(
    Transaction transaction,
    Emitter<InvestmentsState> emit,
  ) async {
    emit(const InvestmentsState.loading());
    final result = await cancelInvestmentUseCase(transaction);
    result.fold(
      (failure) => emit(InvestmentsState.error(failure.message)),
      (_) {},
    );
  }
}
