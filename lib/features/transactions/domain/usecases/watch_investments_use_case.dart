import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchInvestmentsUseCase {
  final TransactionRepository repository;

  WatchInvestmentsUseCase(this.repository);

  Stream<List<Transaction>> call() {
    return repository.watchInvestments();
  }
}
