import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CancelInvestmentUseCase {
  final TransactionRepository transactionRepository;

  CancelInvestmentUseCase({required this.transactionRepository});

  Future<Either<Failure, bool>> call(Transaction transaction) async {
    return await transactionRepository.cancelInvestment(transaction);
  }
}
