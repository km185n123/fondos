import 'package:drift/drift.dart';

@DataClassName('HistoryTable')
class HistoryTables extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get amount => text()();
  BoolColumn get isPositive => boolean()();
}
