import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/fondos/data/datasources/fondo_api_service.dart';
import 'package:fondos/features/fondos/data/datasources/fondo_dao.dart';
import 'package:fondos/features/fondos/domain/entities/fondo.dart';
import 'package:fondos/features/fondos/domain/repositories/fondo_repository.dart';

class FondoRepositoryImpl implements FondoRepository {
  final FondoApiService apiService;
  final FondoDao fondoDao;

  FondoRepositoryImpl({required this.apiService, required this.fondoDao});

  @override
  Future<List<Fondo>> obtenerFondos() async {
    try {
      final fondosDto = await apiService.obtenerFondos();

      final fondosDb = fondosDto
          .map(
            (dto) => FondoDb(
              id: dto.id,
              nombre: dto.nombre,
              montoMinimo: dto.montoMinimo,
              categoria: dto.categoria,
            ),
          )
          .toList();

      await fondoDao.sincronizarFondos(fondosDb);
    } catch (e) {
      //TODO: Manejar el error
    }

    final fondosLocales = await fondoDao.obtenerFondos();

    if (fondosLocales.isEmpty) {
      throw Exception(
        'No se pudieron cargar los fondos. Verifica tu conexión.',
      );
    }

    return fondosLocales
        .map(
          (db) => Fondo(
            id: db.id,
            nombre: db.nombre,
            montoMinimo: db.montoMinimo,
            categoria: db.categoria,
          ),
        )
        .toList();
  }
}
