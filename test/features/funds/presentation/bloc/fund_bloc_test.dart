import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/domain/usecases/get_funds_usecase.dart';
import 'package:fondos/features/funds/domain/usecases/watch_current_balance.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_event.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';

class MockGetFundsUseCase extends Mock implements GetFundsUseCase {}

class MockWatchCurrentBalance extends Mock implements WatchCurrentBalance {}

void main() {
  late FundBloc bloc;
  late MockGetFundsUseCase mockGetFundsUseCase;
  late MockWatchCurrentBalance mockWatchCurrentBalance;

  setUp(() {
    mockGetFundsUseCase = MockGetFundsUseCase();
    mockWatchCurrentBalance = MockWatchCurrentBalance();
    bloc = FundBloc(
      getFundsUseCase: mockGetFundsUseCase,
      watchCurrentBalance: mockWatchCurrentBalance,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tFunds = [
    Fund(id: '1', name: 'Fondo 1', minimumAmount: 100.0, category: 'Acciones'),
    Fund(
      id: '2',
      name: 'Fondo 2',
      minimumAmount: 200.0,
      category: 'Renta Fija',
    ),
  ];

  group('FundBloc', () {
    test('initial state should be FundState.initial()', () {
      expect(bloc.state, const FundState.initial());
    });

    blocTest<FundBloc, FundState>(
      'should emit [Loading, Success] when getFunds is successful',
      build: () {
        when(
          () => mockGetFundsUseCase.call(),
        ).thenAnswer((_) async => const Right(tFunds));
        return bloc;
      },
      act: (bloc) => bloc.add(const FundEvent.getFunds()),
      expect: () => [
        const FundState.loading(),
        const FundState.success(funds: tFunds),
      ],
      verify: (_) {
        verify(() => mockGetFundsUseCase.call()).called(1);
      },
    );

    blocTest<FundBloc, FundState>(
      'should emit [Loading, Error] when getFunds fails',
      build: () {
        when(
          () => mockGetFundsUseCase.call(),
        ).thenAnswer((_) async => const Left(ServerFailure('API ERROR')));
        return bloc;
      },
      act: (bloc) => bloc.add(const FundEvent.getFunds()),
      expect: () => [
        const FundState.loading(),
        const FundState.error('API ERROR'),
      ],
      verify: (_) {
        verify(() => mockGetFundsUseCase.call()).called(1);
      },
    );
  });
}
