import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoryUseCase {
  final HistoryRepository _historyRepository;

  GetHistoryUseCase(this._historyRepository);

  Stream<Either<Failure, List<History>>> call() {
    return _historyRepository.watchHistory();
  }
}
