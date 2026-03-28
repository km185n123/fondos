import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

void main() {
  group('Fund Entity', () {
    test('should correctly instantiate and hold properties', () {
      // arrange
      // act
      const fund = Fund(
        id: '1',
        nombre: 'Fondo Prueba',
        montoMinimo: 500.0,
        categoria: 'Tecnología',
      );

      // assert
      expect(fund.id, '1');
      expect(fund.nombre, 'Fondo Prueba');
      expect(fund.montoMinimo, 500.0);
      expect(fund.categoria, 'Tecnología');
    });

    test('validates equality based on props (freezed)', () {
      // arrange
      const fund1 = Fund(
        id: '1',
        nombre: 'Fondo Prueba',
        montoMinimo: 500.0,
        categoria: 'Tecnología',
      );

      const fund2 = Fund(
        id: '1',
        nombre: 'Fondo Prueba',
        montoMinimo: 500.0,
        categoria: 'Tecnología',
      );

      // act & assert
      expect(fund1, equals(fund2));
    });
  });
}
