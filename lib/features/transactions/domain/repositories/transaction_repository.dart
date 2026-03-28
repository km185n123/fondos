import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Unit>> registerTransaction(Transaction transaction);
}
