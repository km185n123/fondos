// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fondo_dao.dart';

// ignore_for_file: type=lint
mixin _$FondoDaoMixin on DatabaseAccessor<AppDatabase> {
  $FondosTableTable get fondosTable => attachedDatabase.fondosTable;
  FondoDaoManager get managers => FondoDaoManager(this);
}

class FondoDaoManager {
  final _$FondoDaoMixin _db;
  FondoDaoManager(this._db);
  $$FondosTableTableTableManager get fondosTable =>
      $$FondosTableTableTableManager(_db.attachedDatabase, _db.fondosTable);
}
