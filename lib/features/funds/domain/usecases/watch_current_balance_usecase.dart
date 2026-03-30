import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCurrentBalanceUseCase {
  final FundRepository repository;

  WatchCurrentBalanceUseCase({required this.repository});

  Stream<Either<Failure, double>> call() {
    return repository.watchCurrentBalance();
  }
}
