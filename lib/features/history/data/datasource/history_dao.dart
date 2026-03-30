import 'package:drift/drift.dart';
import 'package:fondos/features/history/data/datasource/history_table.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:injectable/injectable.dart';

part 'history_dao.g.dart';

@injectable
@DriftAccessor(tables: [HistoryTables])
class HistoryDao extends DatabaseAccessor<AppDatabase> with _$HistoryDaoMixin {
  HistoryDao(super.db);

  Future<void> insertHistory(HistoryTablesCompanion history) =>
      into(historyTables).insert(history);

  Stream<List<HistoryTable>> watchAll() => select(historyTables).watch();
}
