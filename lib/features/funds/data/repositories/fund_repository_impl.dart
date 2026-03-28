import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/data/datasources/fund_api_service.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FundRepository)
class FundRepositoryImpl implements FundRepository {
  final FundApiService apiService;
  final FundDao fundDao;

  FundRepositoryImpl({required this.apiService, required this.fundDao});

  @override
  Future<List<Fund>> getFunds() async {
    try {
      final fundsDto = await apiService.getFunds();

      final fundsDb = fundsDto
          .map(
            (dto) => FundDb(
              id: dto.id,
              nombre: dto.nombre,
              montoMinimo: dto.montoMinimo,
              categoria: dto.categoria,
            ),
          )
          .toList();

      await fundDao.sincronizarFunds(fundsDb);
    } catch (e) {
      //TODO: Manejar el error
    }

    final fundsLocales = await fundDao.obtenerFunds();

    if (fundsLocales.isEmpty) {
      throw Exception('No se pudieron cargar los funds. Verifica tu conexión.');
    }

    return fundsLocales
        .map(
          (db) => Fund(
            id: db.id,
            nombre: db.nombre,
            montoMinimo: db.montoMinimo,
            categoria: db.categoria,
          ),
        )
        .toList();
  }
}
