import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

void main() {
  group('Fund Entity', () {
    test('should correctly instantiate and hold properties', () {
      // arrange
      // act
      const fund = Fund(
        id: '1',
        name: 'Fondo Prueba',
        minimumAmount: 500.0,
        category: 'Tecnología',
      );

      // assert
      expect(fund.id, '1');
      expect(fund.name, 'Fondo Prueba');
      expect(fund.minimumAmount, 500.0);
      expect(fund.category, 'Tecnología');
    });

    test('validates equality based on props (freezed)', () {
      // arrange
      const fund1 = Fund(
        id: '1',
        name: 'Fondo Prueba',
        minimumAmount: 500.0,
        category: 'Tecnología',
      );

      const fund2 = Fund(
        id: '1',
        name: 'Fondo Prueba',
        minimumAmount: 500.0,
        category: 'Tecnología',
      );

      // act & assert
      expect(fund1, equals(fund2));
    });
  });
}
