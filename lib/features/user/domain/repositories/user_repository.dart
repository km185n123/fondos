import 'package:fondos/features/transactions/domain/entitie/transaction.dart';

abstract class UserRepository {
  Future<double> getCurrentBalance();
  Stream<double> watchBalance();
  Future<void> updateBalance(double newBalance);

  Future<void> saveNotificationPreference(NotificationMethod method);
}
