import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';

void main() {
  late AppDatabase database;
  late UserDao userDao;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    userDao = UserDao(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('UserDao', () {
    test('watchBalance returns default balance when no user exists', () async {
      final balance = await userDao.watchBalance().first;
      expect(balance, 500000.0);
    });

    test('updateBalance creates user if it doesn\'t exist and updates balance', () async {
      await userDao.updateBalance(1000.0);
      final balance = await userDao.watchBalance().first;
      expect(balance, 1000.0);
    });

    test('updateNotificationMethod creates user if it doesn\'t exist and updates method', () async {
      await userDao.updateNotificationMethod('email');
      final user = await userDao.getUser();
      expect(user?.notificationMethod, 'email');
    });

    test('ensureUserExists creates user only if it doesn\'t exist', () async {
      await userDao.ensureUserExists();
      final user1 = await userDao.getUser();
      expect(user1, isNotNull);

      await userDao.updateBalance(2000.0);
      await userDao.ensureUserExists();
      final user2 = await userDao.getUser();
      expect(user2?.balance, 2000.0);
    });
  });
}
