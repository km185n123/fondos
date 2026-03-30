import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/datasources/transactions_table.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [TransactionsTable])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<T> runInTransaction<T>(Future<T> Function() action) {
    return transaction(() => action());
  }

  Future<int> insertTransaction(TransactionDb transaction) {
    return into(transactionsTable).insert(transaction);
  }

  Future<void> updateSyncStatus(String id, SyncStatus status) async {
    await (update(transactionsTable)..where((tbl) => tbl.id.equals(id))).write(
      TransactionsTableCompanion(syncStatus: Value(status.name)),
    );
  }

  Future<List<TransactionDb>> getInvestments() async {
    return await (select(
      transactionsTable,
    )..where((tbl) => tbl.type.equals('subscription'))).get();
  }
}
