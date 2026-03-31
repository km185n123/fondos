// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dao.dart';

// ignore_for_file: type=lint
mixin _$HistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $HistoryTablesTable get historyTables => attachedDatabase.historyTables;
  HistoryDaoManager get managers => HistoryDaoManager(this);
}

class HistoryDaoManager {
  final _$HistoryDaoMixin _db;
  HistoryDaoManager(this._db);
  $$HistoryTablesTableTableManager get historyTables =>
      $$HistoryTablesTableTableManager(_db.attachedDatabase, _db.historyTables);
}
