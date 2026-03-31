import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/transaction_type.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/usecases/cancel_investment_usecase.dart';
import 'package:fondos/features/transactions/domain/usecases/watch_investments_usecase.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockWatchInvestmentsUseCase extends Mock implements WatchInvestmentsUseCase {}
class MockCancelInvestmentUseCase extends Mock implements CancelInvestmentUseCase {}
class MockTransaction extends Mock implements Transaction {}

void main() {
  late MockWatchInvestmentsUseCase mockWatchInvestmentsUseCase;
  late MockCancelInvestmentUseCase mockCancelInvestmentUseCase;

  setUpAll(() {
    registerFallbackValue(MockTransaction());
  });

  setUp(() {
    mockWatchInvestmentsUseCase = MockWatchInvestmentsUseCase();
    mockCancelInvestmentUseCase = MockCancelInvestmentUseCase();
  });

  group('InvestmentsBloc', () {
    final tTransactions = [
      Transaction(
        id: '1',
        name: 'Fund 1',
        type: TransactionType.subscription,
        amount: 100.0,
        fundId: 'fund_1',
        date: DateTime.now(),
        syncStatus: 'pending',
      )
    ];

    blocTest<InvestmentsBloc, InvestmentsState>(
      'emits [loading, success] when startWatching is added',
      build: () {
        when(() => mockWatchInvestmentsUseCase.call())
            .thenAnswer((_) => Stream.fromIterable([tTransactions]));
        return InvestmentsBloc(
          watchInvestmentsUseCase: mockWatchInvestmentsUseCase,
          cancelInvestmentUseCase: mockCancelInvestmentUseCase,
        );
      },
      act: (bloc) => bloc.add(const InvestmentsEvent.startWatching()),
      expect: () => [
        const InvestmentsState.loading(),
        InvestmentsState.success(investments: tTransactions, saldoActual: 100.0),
      ],
    );

    blocTest<InvestmentsBloc, InvestmentsState>(
      'emits [loading] when cancel is added',
      build: () {
        when(() => mockCancelInvestmentUseCase.call(any()))
            .thenAnswer((_) async => const Right(true));
        return InvestmentsBloc(
          watchInvestmentsUseCase: mockWatchInvestmentsUseCase,
          cancelInvestmentUseCase: mockCancelInvestmentUseCase,
        );
      },
      act: (bloc) => bloc.add(InvestmentsEvent.cancel(tTransactions.first)),
      expect: () => [
        const InvestmentsState.loading(),
      ],
    );
  });
}
