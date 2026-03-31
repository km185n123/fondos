import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/history/data/datasource/history_dao.dart';
import 'package:fondos/features/history/data/models/mappers/history_mapper.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:fondos/features/history/domain/repositories/history_repository.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDao _historyDao;

  HistoryRepositoryImpl(this._historyDao);

  @override
  Future<Either<Failure, void>> insertHistory(History history) async {
    try {
      await _historyDao.insertHistory(
        HistoryTablesCompanion.insert(
          title: history.title,
          amount: history.amount,
          isPositive: history.isPositive,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<History>>> watchHistory() {
    return _historyDao.watchAll().map(
      (rows) => Right(rows.map((row) => row.toDomain()).toList()),
    );
  }
}
