import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';
import 'package:fondos/features/transactions/domain/usecases/subscribe_fund_usecase.dart';
import 'package:fondos/features/transactions/domain/usecases/get_investments_use_case.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_bloc.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_state.dart';

class MockSubscribeFundUseCase extends Mock implements SubscribeFundUseCase {}

class MockGetInvestmentsUseCase extends Mock implements GetInvestmentsUseCase {}

void main() {
  late SubscriptionBloc bloc;
  late MockSubscribeFundUseCase mockSubscribeUseCase;
  late MockGetInvestmentsUseCase mockGetInvestmentsUseCase;

  setUpAll(() {
    registerFallbackValue(
      const Fund(
        id: '1',
        name: 'Fondo 1',
        minimumAmount: 100.0,
        category: 'Acciones',
      ),
    );
    registerFallbackValue(NotificationMethod.email);
  });

  setUp(() {
    mockSubscribeUseCase = MockSubscribeFundUseCase();
    mockGetInvestmentsUseCase = MockGetInvestmentsUseCase();
    bloc = SubscriptionBloc(
      subscribeFundUseCase: mockSubscribeUseCase,
      getInvestmentsUseCase: mockGetInvestmentsUseCase,
    );
  });

  tearDown(() {
    bloc.close();
  });

  const tFund = Fund(
    id: 'fund_1',
    name: 'Fondo 1',
    minimumAmount: 100.0,
    category: 'Acciones',
  );

  group('SubscriptionBloc', () {
    test('initial state should have default values', () {
      expect(bloc.state, const SubscriptionState());
      expect(bloc.state.status, SubscriptionStatus.initial);
      expect(bloc.state.availableBalance, 12450000.0);
    });

    blocTest<SubscriptionBloc, SubscriptionState>(
      'should update selectedFund when selectFund event is added',
      build: () => bloc,
      act: (bloc) => bloc.add(const SubscriptionEvent.selectFund(tFund)),
      expect: () => [const SubscriptionState(selectedFund: tFund)],
    );

    blocTest<SubscriptionBloc, SubscriptionState>(
      'should update amount when changeAmount event is added',
      build: () => bloc,
      act: (bloc) => bloc.add(const SubscriptionEvent.changeAmount(500.0)),
      expect: () => [const SubscriptionState(amount: 500.0)],
    );

    blocTest<SubscriptionBloc, SubscriptionState>(
      'should set amountError when changeAmount exceeds balance',
      build: () => bloc,
      act: (bloc) => bloc.add(
        SubscriptionEvent.changeAmount(bloc.state.availableBalance + 1),
      ),
      expect: () => [
        const SubscriptionState(
          amount: 12450000.0 + 1,
          amountError: 'Saldo insuficiente',
        ),
      ],
    );

    blocTest<SubscriptionBloc, SubscriptionState>(
      'should update notificationMethod when changeNotificationMethod event is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const SubscriptionEvent.changeNotificationMethod(
          NotificationMethod.sms,
        ),
      ),
      expect: () => [
        const SubscriptionState(notificationMethod: NotificationMethod.sms),
      ],
    );

    group('confirm', () {
      blocTest<SubscriptionBloc, SubscriptionState>(
        'should emit error when no fund is selected',
        build: () => bloc,
        act: (bloc) => bloc.add(const SubscriptionEvent.confirm()),
        expect: () => [
          const SubscriptionState(
            status: SubscriptionStatus.error,
            errorMessage: 'Por favor selecciona un fondo',
          ),
        ],
      );

      blocTest<SubscriptionBloc, SubscriptionState>(
        'should emit error when amount is below minimum',
        seed: () => const SubscriptionState(
          selectedFund: tFund,
          amount: 50.0,
          notificationMethod: NotificationMethod.email,
        ),
        build: () => bloc,
        act: (bloc) => bloc.add(const SubscriptionEvent.confirm()),
        expect: () => [
          const SubscriptionState(
            selectedFund: tFund,
            amount: 50.0,
            notificationMethod: NotificationMethod.email,
            status: SubscriptionStatus.error,
            errorMessage: 'El monto debe ser al menos COP 100.0',
          ),
        ],
      );

      blocTest<SubscriptionBloc, SubscriptionState>(
        'should emit [loading, success] when use case returns success',
        seed: () => const SubscriptionState(
          selectedFund: tFund,
          amount: 200.0,
          notificationMethod: NotificationMethod.email,
        ),
        build: () {
          when(
            () => mockSubscribeUseCase.call(
              fund: any(named: 'fund'),
              amount: any(named: 'amount'),
              notificationMethod: any(named: 'notificationMethod'),
            ),
          ).thenAnswer(
            (_) async =>
                const Right(TransactionResponse(status: 'ok', message: 'done')),
          );
          return bloc;
        },
        act: (bloc) => bloc.add(const SubscriptionEvent.confirm()),
        expect: () => [
          const SubscriptionState(
            selectedFund: tFund,
            amount: 200.0,
            notificationMethod: NotificationMethod.email,
            status: SubscriptionStatus.loading,
          ),
          const SubscriptionState(
            selectedFund: tFund,
            amount: 200.0,
            notificationMethod: NotificationMethod.email,
            status: SubscriptionStatus.success,
          ),
        ],
      );

      blocTest<SubscriptionBloc, SubscriptionState>(
        'should emit [loading, error] when use case returns failure',
        seed: () => const SubscriptionState(
          selectedFund: tFund,
          amount: 200.0,
          notificationMethod: NotificationMethod.email,
        ),
        build: () {
          when(
            () => mockSubscribeUseCase.call(
              fund: any(named: 'fund'),
              amount: any(named: 'amount'),
              notificationMethod: any(named: 'notificationMethod'),
            ),
          ).thenAnswer((_) async => const Left(ServerFailure('API ERROR')));
          return bloc;
        },
        act: (bloc) => bloc.add(const SubscriptionEvent.confirm()),
        expect: () => [
          const SubscriptionState(
            selectedFund: tFund,
            amount: 200.0,
            notificationMethod: NotificationMethod.email,
            status: SubscriptionStatus.loading,
          ),
          const SubscriptionState(
            selectedFund: tFund,
            amount: 200.0,
            notificationMethod: NotificationMethod.email,
            status: SubscriptionStatus.error,
            errorMessage: 'API ERROR',
          ),
        ],
      );
    });
    group('confirm validations', () {
      blocTest<SubscriptionBloc, SubscriptionState>(
        'should emit error when no notification method is selected',
        seed: () => const SubscriptionState(selectedFund: tFund, amount: 200.0),
        build: () => bloc,
        act: (bloc) => bloc.add(const SubscriptionEvent.confirm()),
        expect: () => [
          const SubscriptionState(
            selectedFund: tFund,
            amount: 200.0,
            status: SubscriptionStatus.error,
            errorMessage: 'Debe elegir email o SMS',
          ),
        ],
      );
    });
  });
}
