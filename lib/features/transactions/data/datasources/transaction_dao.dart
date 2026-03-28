import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/transactions/data/datasources/transactions_table.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [TransactionsTable])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<int> insertTransaction(TransactionDb transaction) {
    return into(
      transactionsTable,
    ).insert(transaction, mode: InsertMode.insertOrReplace);
  }
}
