import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/core/utils/safe_use_case.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubscribeFundUseCase {
  final UserRepository _userRepo;
  final TransactionRepository _transactionRepo;

  SubscribeFundUseCase(this._userRepo, this._transactionRepo);

  Future<Either<Failure, TransactionResponse>> call({
    required Fund fund,
    required double amount,
    required NotificationMethod notificationMethod,
  }) => SafeUseCase.execute(() async {
    if (!fund.canSubscribe(amount)) {
      return Left(
        BusinessFailure('Monto inferior al mínimo de ${fund.minimumAmount}'),
      );
    }

    final transaction = Transaction.subscription(
      fundId: fund.id,
      amount: amount,
      name: fund.name,
    );

    final result = await _transactionRepo.subscribeFund(
      transaction: transaction,
    );

    if (result.isLeft()) {
      return Left(result.swap().getOrElse((_) => const ServerFailure('Error')));
    }

    final response = result.getOrElse((_) => throw Exception());

    // fire & forget
    unawaited(_userRepo.saveNotificationPreference(notificationMethod));

    return Right(response);
  });
}
