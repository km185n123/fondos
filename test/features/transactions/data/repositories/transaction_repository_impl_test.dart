import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/transaction_type.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_api_service.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';
import 'package:fondos/core/database/app_database.dart';

class MockTransactionApiService extends Mock implements TransactionApiService {}

void main() {
  late AppDatabase database;
  late TransactionDao transactionDao;
  late UserDao userDao;
  late TransactionRepositoryImpl repository;
  late MockTransactionApiService mockApiService;

  setUpAll(() {
    registerFallbackValue(
      TransactionDTO(
        id: '',
        name: '',
        type: '',
        amount: 0,
        fundId: '',
        date: DateTime.now(),
        syncStatus: '',
      ),
    );
  });

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    transactionDao = TransactionDao(database);
    userDao = UserDao(database);
    mockApiService = MockTransactionApiService();

    repository = TransactionRepositoryImpl(
      transactionDao: transactionDao,
      userDao: userDao,
      apiService: mockApiService,
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('TransactionRepositoryImpl (with in-memory DB)', () {
    final tTransaction = Transaction(
      id: '1',
      name: 'Fund 1',
      type: TransactionType.subscription,
      amount: 100.0,
      fundId: 'fund_1',
      date: DateTime(2026, 3, 29),
      syncStatus: SyncStatus.pending.name,
    );

    const tResponse = TransactionResponse(status: 'success', message: 'Done');
    const tResponseDto = TransactionResponseDTO(
      status: 'success',
      message: 'Done',
    );

    test(
      'subscribeFund should return Right(TransactionResponse) when everything succeeds',
      () async {
        // arrange
        when(
          () => mockApiService.createTransaction(any()),
        ).thenAnswer((_) async => tResponseDto);

        // act
        final result = await repository.subscribeFund(
          transaction: tTransaction,
        );

        // assert
        expect(result, equals(const Right(tResponse)));

        final balance = await userDao.watchBalance().first;
        expect(balance, 500000.0 - 100.0);

        final transactions = await database
            .select(database.transactionsTable)
            .get();
        expect(transactions.length, 1);
        expect(transactions.first.syncStatus, SyncStatus.synced.name);
      },
    );

    test(
      'subscribeFund should return Left(Failure) when balance is insufficient',
      () async {
        // arrange
        await userDao.updateBalance(50.0);

        // act
        final result = await repository.subscribeFund(
          transaction: tTransaction,
        );

        // assert
        expect(result.isLeft(), true);

        final balance = await userDao.watchBalance().first;
        expect(balance, 50.0);
      },
    );

    test(
      'subscribeFund should return Left(Failure) when API call fails',
      () async {
        // arrange
        when(
          () => mockApiService.createTransaction(any()),
        ).thenThrow(Exception('API_ERROR'));

        // act
        final result = await repository.subscribeFund(
          transaction: tTransaction,
        );

        // assert
        expect(result.isLeft(), true);

        // Transaction should be in DB but still pending or at least inserted
        final transactions = await database
            .select(database.transactionsTable)
            .get();
        expect(transactions.length, 1);
        // It should NOT be synced if API failed
        expect(transactions.first.syncStatus, SyncStatus.pending.name);
      },
    );
  });
}
