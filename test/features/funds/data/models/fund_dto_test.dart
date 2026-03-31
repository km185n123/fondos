import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

void main() {
  const tFundDto = FundDTO(
    id: '1',
    name: 'Fondo Test',
    minimumAmount: 1000.0,
    category: 'Inversión',
  );

  final tFundJson = {
    'id': '1',
    'name': 'Fondo Test',
    'minimumAmount': 1000.0,
    'category': 'Inversión',
  };

  group('FundDTO', () {
    test('should return a valid DTO from JSON', () {
      // arrange
      // act
      final result = FundDTO.fromJson(tFundJson);

      // assert
      expect(result, equals(tFundDto));
    });

    test('should transform to Domain Entity correctly', () {
      // arrange
      const expectedDomain = Fund(
        id: '1',
        name: 'Fondo Test',
        minimumAmount: 1000.0,
        category: 'Inversión',
      );

      // act
      final result = tFundDto.toDomain();

      // assert
      expect(result, equals(expectedDomain));
    });
  });
}
