import 'package:fondos/core/enum/notification_method.dart';

abstract class UserRepository {
  Future<double> getCurrentBalance();
  Stream<double> watchBalance();
  Future<void> updateBalance(double newBalance);

  Future<void> saveNotificationPreference(NotificationMethod method);
}
