import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:fondos/features/funds/data/models/mappers/fund_dto_mapper.dart';

void main() {
  group('FundDtoMapper', () {
    test('toDb should convert FundDTO to FundDb correctly', () {
      final dto = FundDTO(
        id: '1',
        name: 'Fund 1',
        minimumAmount: 1000.0,
        category: 'Category 1',
      );

      final db = dto.toDb();

      expect(db.id, dto.id);
      expect(db.name, dto.name);
      expect(db.minimumAmount, dto.minimumAmount);
      expect(db.category, dto.category);
    });
  });
}
