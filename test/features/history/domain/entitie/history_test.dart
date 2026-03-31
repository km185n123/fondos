import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';

void main() {
  group('History Entity', () {
    test('should create History entity correctly', () {
      const history = History(
        title: 'Transaction 1',
        amount: '\$100.00',
        isPositive: true,
      );

      expect(history.title, 'Transaction 1');
      expect(history.amount, '\$100.00');
      expect(history.isPositive, true);
    });

    test('should support value equality', () {
      const history1 = History(
        title: 'Transaction 1',
        amount: '\$100.00',
        isPositive: true,
      );
      const history2 = History(
        title: 'Transaction 1',
        amount: '\$100.00',
        isPositive: true,
      );

      expect(history1, equals(history2));
    });
  });
}
