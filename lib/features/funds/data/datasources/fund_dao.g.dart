// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_dao.dart';

// ignore_for_file: type=lint
mixin _$FundDaoMixin on DatabaseAccessor<AppDatabase> {
  $FundsTableTable get fundsTable => attachedDatabase.fundsTable;
  FundDaoManager get managers => FundDaoManager(this);
}

class FundDaoManager {
  final _$FundDaoMixin _db;
  FundDaoManager(this._db);
  $$FundsTableTableTableManager get fundsTable =>
      $$FundsTableTableTableManager(_db.attachedDatabase, _db.fundsTable);
}
