import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';

abstract class HistoryRepository {
  Future<Either<Failure, void>> insertHistory(History history);
  Stream<Either<Failure, List<History>>> watchHistory();
}
