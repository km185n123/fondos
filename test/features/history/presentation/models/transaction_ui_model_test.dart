import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/history/presentation/models/transaction_ui_model.dart';

void main() {
  group('TransactionUiModel', () {
    test('should create correctly', () {
      const model = TransactionUiModel(
        title: 'Title',
        amount: '100',
        isPositive: true,
      );

      expect(model.title, 'Title');
      expect(model.amount, '100');
      expect(model.isPositive, true);
    });

    test('should support value equality', () {
      const model1 = TransactionUiModel(
        title: 'Title',
        amount: '100',
        isPositive: true,
      );
      const model2 = TransactionUiModel(
        title: 'Title',
        amount: '100',
        isPositive: true,
      );

      expect(model1, equals(model2));
    });
  });
}
