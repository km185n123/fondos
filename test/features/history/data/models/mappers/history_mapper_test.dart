import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/history/data/models/mappers/history_mapper.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';

void main() {
  group('HistoryMapper', () {
    test('toDomain should convert HistoryTable to History correctly', () {
      const tableRow = HistoryTable(
        id: 1,
        title: 'Test Title',
        amount: '\$100.00',
        isPositive: true,
      );

      final domain = tableRow.toDomain();

      expect(domain, const History(
        title: 'Test Title',
        amount: '\$100.00',
        isPositive: true,
      ));
    });
  });
}
