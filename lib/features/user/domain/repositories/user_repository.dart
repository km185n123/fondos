import 'package:fondos/features/transactions/domain/entitie/transaction.dart';

abstract class UserRepository {
  Future<double> getCurrentBalance();

  Future<void> updateBalance(double newBalance);

  Future<void> saveNotificationPreference(NotificationMethod method);
}
