import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/history/data/models/history_dto.dart';

void main() {
  group('HistoryDto', () {
    test('should create correctly from JSON', () {
      final json = {
        'title': 'Transaction 1',
        'amount': '100.00',
        'isPositive': true,
      };

      final dto = HistoryDto.fromJson(json);

      expect(dto.title, 'Transaction 1');
      expect(dto.amount, '100.00');
      expect(dto.isPositive, true);
    });

    test('should convert to JSON correctly', () {
      const dto = HistoryDto(
        title: 'Transaction 1',
        amount: '100.00',
        isPositive: true,
      );

      final json = dto.toJson();

      expect(json['title'], 'Transaction 1');
      expect(json['amount'], '100.00');
      expect(json['isPositive'], true);
    });
  });
}
