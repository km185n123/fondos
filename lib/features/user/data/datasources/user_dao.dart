import 'package:drift/drift.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/user/data/datasources/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  static const _userId = '1';
  static const _defaultBalance = 500000.0;

  Future<UserDb?> getUser() =>
      (select(userTable)..where((t) => t.id.equals(_userId))).getSingleOrNull();

  Stream<double> watchBalance() =>
      (select(userTable)..where((t) => t.id.equals(_userId)))
          .watchSingleOrNull()
          .map((user) => user?.balance ?? _defaultBalance);

  Future<double> getBalance() async {
    final user = await getUser();
    if (user == null) {
      await _createDefaultUser();
      return _defaultBalance;
    }
    return user.balance;
  }

  Future<void> _createDefaultUser() async {
    await into(userTable).insert(
      UserTableCompanion.insert(
        id: const Value(_userId),
        balance: const Value(_defaultBalance),
      ),
    );
  }

  Future<void> ensureUserExists() async {
    final exists = await getUser();
    if (exists == null) {
      await _createDefaultUser();
    }
  }

  Future<void> updateBalance(double newBalance) async {
    await ensureUserExists();

    await (update(userTable)..where((t) => t.id.equals(_userId))).write(
      UserTableCompanion(balance: Value(newBalance)),
    );
  }

  Future<void> updateNotificationMethod(String method) async {
    await ensureUserExists();

    await (update(userTable)..where((t) => t.id.equals(_userId))).write(
      UserTableCompanion(notificationMethod: Value(method)),
    );
  }
}
