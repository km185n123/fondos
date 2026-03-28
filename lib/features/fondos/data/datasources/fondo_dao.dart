import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';

import 'fondos_table.dart';

part 'fondo_dao.g.dart';

@DriftAccessor(tables: [FondosTable])
class FondoDao extends DatabaseAccessor<AppDatabase> with _$FondoDaoMixin {
  FondoDao(super.db);

  Future<List<FondoDb>> obtenerFondos() => select(fondosTable).get();

  Future<int> insertarFondo(FondoDb fondo) {
    return into(fondosTable).insert(fondo, mode: InsertMode.insertOrReplace);
  }

  Future<void> sincronizarFondos(List<FondoDb> fondosNuevos) async {
    await batch((batch) {
      batch.deleteAll(fondosTable);
      batch.insertAll(
        fondosTable,
        fondosNuevos,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
