import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/core/utils/safe_call';
import 'package:fondos/features/funds/data/datasources/fund_api_service.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/funds/data/models/mappers/fund_db_mapper.dart';
import 'package:fondos/features/funds/data/models/mappers/fund_dto_mapper.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FundRepository)
class FundRepositoryImpl implements FundRepository {
  final FundApiService apiService;
  final FundDao fundDao;

  FundRepositoryImpl({required this.apiService, required this.fundDao});

  @override
  Future<Either<Failure, List<Fund>>> getFunds() {
    return SafeCall.execute(
      tryBlock: _fetchRemoteAndCache,
      fallback: _fetchLocal,
    );
  }

  Future<List<Fund>> _fetchRemoteAndCache() async {
    final dtos = await apiService.getFunds();

    final dbModels = dtos.map((e) => e.toDb()).toList();
    await fundDao.synchronizeFunds(dbModels);

    return dbModels.map((e) => e.toDomain()).toList();
  }

  Future<List<Fund>> _fetchLocal() async {
    final local = await fundDao.getFunds();

    if (local.isEmpty) {
      throw CacheException(ErrorMessages.noCacheData); // importante
    }

    return local.map((e) => e.toDomain()).toList();
  }
}
