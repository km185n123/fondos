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

part 'app_database.g.dart';

@DriftDatabase(
  tables: [FundsTable, TransactionsTable, UserTable],
  daos: [FundDao, TransactionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;
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
