import 'package:drift/drift.dart';

@DataClassName('FundDb')
class FundsTable extends Table {
  TextColumn get id => text()();
  TextColumn get nombre => text()();
  RealColumn get montoMinimo => real()();
  TextColumn get categoria => text()();

  @override
  Set<Column> get primaryKey => {id};
}
