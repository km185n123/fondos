import 'package:fondos/features/transactions/domain/entitie/transaction.dart';

abstract class TransactionRepository {
  Future<void> registerTransaction(Transaction transaction);
}
