import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';

void main() {
  late AppDatabase database;
  late TransactionDao transactionDao;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    transactionDao = TransactionDao(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('TransactionDao', () {
    final tTransactionDb = TransactionDb(
      id: '1',
      type: 'subscription',
      amount: 100.0,
      fundId: 'fund_1',
      date: DateTime(2026, 3, 29),
      syncStatus: SyncStatus.pending.name,
    );

    test('insertTransaction should insert a transaction and return its id', () async {
      // act
      final result = await transactionDao.insertTransaction(tTransactionDb);

      // assert
      expect(result, isPositive);
      final transactions = await database.select(database.transactionsTable).get();
      expect(transactions.length, 1);
      expect(transactions.first.id, tTransactionDb.id);
    });

    test('updateSyncStatus should update the sync status of a transaction', () async {
      // arrange
      await transactionDao.insertTransaction(tTransactionDb);

      // act
      await transactionDao.updateSyncStatus(tTransactionDb.id, SyncStatus.synced);

      // assert
      final transaction = await (database.select(database.transactionsTable)
            ..where((tbl) => tbl.id.equals(tTransactionDb.id)))
          .getSingle();
      expect(transaction.syncStatus, SyncStatus.synced.name);
    });

    test('runInTransaction should execute actions together', () async {
      // act
      await transactionDao.runInTransaction(() async {
        await transactionDao.insertTransaction(tTransactionDb);
        await transactionDao.updateSyncStatus(tTransactionDb.id, SyncStatus.synced);
      });

      // assert
      final transaction = await (database.select(database.transactionsTable)
            ..where((tbl) => tbl.id.equals(tTransactionDb.id)))
          .getSingle();
      expect(transaction.syncStatus, SyncStatus.synced.name);
    });
  });
}
