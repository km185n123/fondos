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
  AppDatabase.forTesting(super.e);
  AppDatabase(super.e);

  @override
  int get schemaVersion => 4;
}
