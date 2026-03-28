import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';

void main() {
  late AppDatabase db;
  late FundDao dao;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = FundDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('FundDao', () {
    final tFundDb = const FundDb(
      id: '1',
      nombre: 'Fondo Test DB',
      montoMinimo: 1500.0,
      categoria: 'Mixto',
    );

    test('should return empty list when no funds exist', () async {
      // arrange
      // act
      final result = await dao.getFunds();

      // assert
      expect(result, isEmpty);
    });

    test('should insert and get funds', () async {
      // arrange
      await dao.insertFund(tFundDb);

      // act
      final result = await dao.getFunds();

      // assert
      expect(result.length, 1);
      expect(result.first, equals(tFundDb));
    });

    test(
      'should synchronize funds correctly (delete old and insert new)',
      () async {
        // arrange
        await dao.insertFund(
          const FundDb(
            id: 'old_1',
            nombre: 'Old 1',
            montoMinimo: 0.0,
            categoria: 'C',
          ),
        );

        final newFunds = [
          tFundDb,
          const FundDb(
            id: '2',
            nombre: 'Fondo Nuevo 2',
            montoMinimo: 2000.0,
            categoria: 'Fijo',
          ),
        ];

        // act
        await dao.synchronizeFunds(newFunds);
        final result = await dao.getFunds();

        // assert
        expect(result.length, 2);
        expect(result.any((f) => f.id == 'old_1'), isFalse);
        expect(result.any((f) => f.id == '1'), isTrue);
        expect(result.any((f) => f.id == '2'), isTrue);
      },
    );
  });
}
