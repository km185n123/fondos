import 'package:drift/drift.dart';

@DataClassName('FundDb')
class FundsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get minimumAmount => real()();
  TextColumn get category => text()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get invested => text().nullable()();
  TextColumn get currentValue => text().nullable()();
  TextColumn get returnPct => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
