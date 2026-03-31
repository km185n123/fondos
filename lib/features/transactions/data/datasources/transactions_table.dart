import 'package:drift/drift.dart';

@DataClassName('TransactionDb')
class TransactionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get fundId => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
