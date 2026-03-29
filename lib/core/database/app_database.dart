import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:fondos/features/funds/data/datasources/funds_table.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/transactions/data/datasources/transactions_table.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_table.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [FundsTable, TransactionsTable, UserTable],
  daos: [FundDao, TransactionDao, UserDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          // Seed: default user with initial balance
          await into(userTable).insertOnConflictUpdate(
            UserTableCompanion.insert(
              id: const Value('1'),
              balance: const Value(500000.0),
            ),
          );
        },
        onUpgrade: (m, from, to) async {
          // v1 → v2: user_table was added
          if (from < 2) {
            await m.createTable(userTable);
            await into(userTable).insertOnConflictUpdate(
              UserTableCompanion.insert(
                id: const Value('1'),
                balance: const Value(500000.0),
              ),
            );
          }
          // v2 → v3: sync_status column added to transactions_table
          if (from < 3) {
            await m.addColumn(
              transactionsTable,
              transactionsTable.syncStatus,
            );
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));

    const secureStorage = FlutterSecureStorage();
    const keyAlias = 'db_encryption_key';

    String? encryptionKey = await secureStorage.read(key: keyAlias);

    if (encryptionKey == null) {
      final random = Random.secure();
      final keyBytes = List<int>.generate(32, (_) => random.nextInt(256));
      encryptionKey = base64UrlEncode(keyBytes);
      await secureStorage.write(key: keyAlias, value: encryptionKey);
    }

    return NativeDatabase.createInBackground(
      file,
      setup: (rawDb) {
        rawDb.execute("PRAGMA key = '$encryptionKey';");
      },
    );
  });
}
