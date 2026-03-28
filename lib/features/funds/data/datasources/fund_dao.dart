import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';

import 'funds_table.dart';

part 'fund_dao.g.dart';

@DriftAccessor(tables: [FundsTable])
class FundDao extends DatabaseAccessor<AppDatabase> with _$FundDaoMixin {
  FundDao(super.db);

  Future<List<FundDb>> obtenerFunds() => select(fundsTable).get();

  Future<int> insertarFund(FundDb fund) {
    return into(fundsTable).insert(fund, mode: InsertMode.insertOrReplace);
  }

  Future<void> sincronizarFunds(List<FundDb> fundsNuevos) async {
    await batch((batch) {
      batch.deleteAll(fundsTable);
      batch.insertAll(
        fundsTable,
        fundsNuevos,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
