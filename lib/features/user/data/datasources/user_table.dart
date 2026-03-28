import 'package:drift/drift.dart';

@DataClassName('UserDb')
class UserTable extends Table {
  TextColumn get id => text().clientDefault(() => '1')();
  RealColumn get balance => real().withDefault(const Constant(500000.0))();
  TextColumn get notificationMethod => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
