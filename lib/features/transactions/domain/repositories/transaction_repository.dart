import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionResponse>> subscribeFund({
    required Transaction transaction,
  });
}
