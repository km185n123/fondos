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

  Future<void> call({
    required Fund fund,
    required double amount,
    required NotificationMethod notificationMethod,
  }) async {
    if (amount < fund.montoMinimo) {
      throw Exception('El monto debe ser al menos COP ${fund.montoMinimo}');
    }

    final currentBalance = await userRepository.getCurrentBalance();
    if (currentBalance < amount) {
      throw Exception('Saldo insuficiente');
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
    await transactionRepository.registerTransaction(transaction);

    await userRepository.saveNotificationPreference(notificationMethod);
  }
}
