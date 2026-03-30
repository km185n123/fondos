import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';
import 'package:fondos/features/transactions/domain/usecases/subscribe_fund_usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late SubscribeFundUseCase useCase;
  late MockUserRepository mockUserRepo;
  late MockTransactionRepository mockTransactionRepo;

  setUpAll(() {
    registerFallbackValue(
      const Fund(
        id: '1',
        name: 'Fondo 1',
        minimumAmount: 100.0,
        category: 'Acciones',
      ),
    );
    registerFallbackValue(
      Transaction.subscription(fundId: '1', amount: 100.0, name: 'Fondo 1'),
    );
    registerFallbackValue(NotificationMethod.email);
  });

  setUp(() {
    mockUserRepo = MockUserRepository();
    mockTransactionRepo = MockTransactionRepository();
    useCase = SubscribeFundUseCase(mockUserRepo, mockTransactionRepo);
  });

  const tFund = Fund(
    id: 'fund_1',
    name: 'Fondo 1',
    minimumAmount: 100.0,
    category: 'Acciones',
  );

  const tResponse = TransactionResponse(
    status: 'success',
    message: 'Subscribed',
  );

  group('SubscribeFundUseCase', () {
    test(
      'should return Right(TransactionResponse) when subscription is successful',
      () async {
        // arrange
        when(
          () => mockTransactionRepo.subscribeFund(
            transaction: any(named: 'transaction'),
          ),
        ).thenAnswer((_) async => const Right(tResponse));
        when(
          () => mockUserRepo.saveNotificationPreference(any()),
        ).thenAnswer((_) async {});

        // act
        final result = await useCase(
          fund: tFund,
          amount: 200.0,
          notificationMethod: NotificationMethod.email,
        );

        // assert
        expect(result, equals(const Right(tResponse)));
        verify(
          () => mockTransactionRepo.subscribeFund(
            transaction: any(named: 'transaction'),
          ),
        ).called(1);
        verify(
          () =>
              mockUserRepo.saveNotificationPreference(NotificationMethod.email),
        ).called(1);
      },
    );

    test(
      'should return Left(BusinessFailure) when amount is below minimum',
      () async {
        // act
        final result = await useCase(
          fund: tFund,
          amount: 50.0,
          notificationMethod: NotificationMethod.email,
        );

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<BusinessFailure>()),
          (_) => fail('Should have returned a failure'),
        );
        verifyNever(
          () => mockTransactionRepo.subscribeFund(
            transaction: any(named: 'transaction'),
          ),
        );
      },
    );

    test(
      'should return Left(Failure) when repository returns a failure',
      () async {
        // arrange
        when(
          () => mockTransactionRepo.subscribeFund(
            transaction: any(named: 'transaction'),
          ),
        ).thenAnswer((_) async => const Left(ServerFailure('API ERROR')));

        // act
        final result = await useCase(
          fund: tFund,
          amount: 200.0,
          notificationMethod: NotificationMethod.sms,
        );

        // assert
        expect(result.isLeft(), true);
        verify(
          () => mockTransactionRepo.subscribeFund(
            transaction: any(named: 'transaction'),
          ),
        ).called(1);
      },
    );
  });
}
