import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/history/data/datasource/history_dao.dart';

void main() {
  late AppDatabase database;
  late HistoryDao historyDao;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    historyDao = HistoryDao(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('HistoryDao', () {
    test('watchAll returns empty list when no history exists', () async {
      final history = await historyDao.watchAll().first;
      expect(history, isEmpty);
    });

    test('insertHistory adds a record and watchAll emits it', () async {
      final historyEntry = HistoryTablesCompanion.insert(
        title: 'Test Title',
        amount: '\$100.00',
        isPositive: true,
      );

      await historyDao.insertHistory(historyEntry);

      final history = await historyDao.watchAll().first;
      expect(history, hasLength(1));
      expect(history.first.title, 'Test Title');
      expect(history.first.amount, '\$100.00');
      expect(history.first.isPositive, true);
    });
  });
}
