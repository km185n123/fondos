import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/data/datasources/funds_table.dart';

part 'fund_dao.g.dart';

@DriftAccessor(tables: [FundsTable])
class FundDao extends DatabaseAccessor<AppDatabase> with _$FundDaoMixin {
  FundDao(super.db);

  Future<List<FundDb>> getFunds() => select(fundsTable).get();

  Future<int> insertFund(FundDb fund) {
    return into(fundsTable).insert(fund, mode: InsertMode.insertOrReplace);
  }

  Future<void> synchronizeFunds(List<FundDb> fundsNews) async {
    await batch((batch) {
      batch.deleteAll(fundsTable);
      batch.insertAll(fundsTable, fundsNews, mode: InsertMode.insertOrReplace);
    });
  }
}
