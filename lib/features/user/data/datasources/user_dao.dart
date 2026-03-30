import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/user/data/datasources/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserDb?> getUser() => select(userTable).getSingleOrNull();
  Stream<double> watchBalance() =>
      select(userTable).watchSingle().map((user) => user.balance);

  Future<double> getBalance() async {
    final user = await getUser();
    if (user == null) {
      await into(userTable).insert(const UserTableCompanion(id: Value('1')));
      return 500000.0;
    }
    return user.balance;
  }

  Future<void> updateBalance(double newBalance) async {
    final user = await getUser();
    if (user == null) {
      await into(userTable).insert(
        UserTableCompanion(id: const Value('1'), balance: Value(newBalance)),
      );
    } else {
      await update(
        userTable,
      ).write(UserTableCompanion(balance: Value(newBalance)));
    }
  }

  Future<void> updateNotificationMethod(String method) async {
    final user = await getUser();
    if (user == null) {
      await into(userTable).insert(
        UserTableCompanion(
          id: const Value('1'),
          notificationMethod: Value(method),
        ),
      );
    } else {
      await update(
        userTable,
      ).write(UserTableCompanion(notificationMethod: Value(method)));
    }
  }
}
