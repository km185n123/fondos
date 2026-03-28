import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';

class SubscribeFundUseCase {
  final UserRepository userRepository;
  final TransactionRepository transactionRepository;

  SubscribeFundUseCase({
    required this.userRepository,
    required this.transactionRepository,
  });

  Future<void> call({
    required Fund fund,
    required double amountToInvest,
    required NotificationMethod notificationMethod,
  }) async {
    if (amountToInvest < fund.montoMinimo) {
      throw Exception('The amount must be at least COP ${fund.montoMinimo}');
    }

    final currentBalance = await userRepository.getCurrentBalance();

    if (currentBalance < amountToInvest) {
      throw Exception('Insufficient balance');
    }

    final newBalance = currentBalance - amountToInvest;
    await userRepository.updateBalance(newBalance);

    await userRepository.saveNotificationPreference(notificationMethod);

    final transaction = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: TransactionType.subscription,
      amount: amountToInvest,
      fundId: fund.id,
      date: DateTime.now(),
    );

    await transactionRepository.registerTransaction(transaction);
  }
}
