import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubscribeFundUseCase {
  final UserRepository userRepository;
  final TransactionRepository transactionRepository;

  SubscribeFundUseCase({
    required this.userRepository,
    required this.transactionRepository,
  });

  Future<Either<Failure, Unit>> call({
    required Fund fund,
    required double amount,
    required NotificationMethod notificationMethod,
  }) async {
    if (amount < fund.montoMinimo) {
      return Left(ServerFailure('El monto debe ser al menos COP ${fund.montoMinimo}'));
    }

    final currentBalance = await userRepository.getCurrentBalance();
    if (currentBalance < amount) {
      return const Left(ServerFailure('Saldo insuficiente'));
    }

    final newBalance = currentBalance - amount;
    await userRepository.updateBalance(newBalance);

    final transaction = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: TransactionType.subscription,
      amount: amount,
      fundId: fund.id,
      date: DateTime.now(),
    );
    
    final result = await transactionRepository.registerTransaction(transaction);
    
    return result.fold(
      (failure) => Left(failure),
      (_) async {
        await userRepository.saveNotificationPreference(notificationMethod);
        return const Right(unit);
      },
    );
  }
}
