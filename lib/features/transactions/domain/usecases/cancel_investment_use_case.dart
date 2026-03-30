import 'dart:async';

import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/repositories/history_repository.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CancelInvestmentUseCase {
  final TransactionRepository transactionRepository;
  final HistoryRepository _historyRepo;

  CancelInvestmentUseCase(
    this.transactionRepository,
    this._historyRepo,
  );

  Future<Either<Failure, bool>> call(Transaction transaction) async {
    unawaited(
      _historyRepo.insertHistory(
        History(
          title: transaction.name,
          amount: '-\$${transaction.amount.toStringAsFixed(2)}',
          isPositive: false,
        ),
      ),
    );
    return await transactionRepository.cancelInvestment(transaction);
  }
}
