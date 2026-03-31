import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/data/models/mappers/fund_db_mapper.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

void main() {
  group('FundDbMapper', () {
    test('toDomain should convert FundDb to Fund correctly', () {
      final db = FundDb(
        id: '1',
        name: 'Fund 1',
        minimumAmount: 1000.0,
        category: 'Category 1',
      );

      final domain = db.toDomain();

      expect(domain, const Fund(
        id: '1',
        name: 'Fund 1',
        minimumAmount: 1000.0,
        category: 'Category 1',
      ));
    });
  });
}
