import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetInvestmentsUseCase {
  final TransactionRepository repository;

  GetInvestmentsUseCase(this.repository);

  Future<Either<Failure, List<Transaction>>> call() async {
    return await repository.getInvestments();
  }
}
