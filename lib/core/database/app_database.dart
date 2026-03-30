import 'package:drift/drift.dart';
import 'package:fondos/core/database/db_seeder_config.dart';
import 'package:fondos/features/funds/data/datasources/funds_table.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/transactions/data/datasources/transactions_table.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_table.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:fondos/features/history/data/datasource/history_table.dart';
import 'package:fondos/features/history/data/datasource/history_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [FundsTable, TransactionsTable, UserTable, HistoryTables],
  daos: [FundDao, TransactionDao, UserDao, HistoryDao],
)
class AppDatabase extends _$AppDatabase {
  final DbSeederConfig config;

  AppDatabase.forTesting(super.e, this.config);
  AppDatabase(super.e, this.config);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedInitialUser();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(userTable);
        await _seedInitialUser();
      }
      if (from < 3) {
        await m.addColumn(transactionsTable, transactionsTable.syncStatus);
      }
      if (from < 4) {
        await m.createTable(historyTables);
      }
    },
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> _seedInitialUser() async {
    await into(userTable).insertOnConflictUpdate(
      UserTableCompanion.insert(
        id: Value(config.initialUserId),
        balance: Value(config.initialUserBalance),
      ),
    );
  }
}
