import 'package:fondos/core/enum/notification_method.dart';
import 'package:injectable/injectable.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDao userDao;

  UserRepositoryImpl(this.userDao);

  @override
  Stream<double> watchBalance() {
    return userDao.watchBalance();
  }

  @override
  Future<void> updateBalance(double newBalance) async {
    await userDao.updateBalance(newBalance);
  }

  @override
  Future<void> saveNotificationPreference(NotificationMethod method) async {
    await userDao.updateNotificationMethod(method.name);
  }
}
