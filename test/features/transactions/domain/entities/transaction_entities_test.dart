import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';

void main() {
  group('Transaction', () {
    const tFundId = 'fund_1';
    const tAmount = 100.0;

    test('Transaction.subscription should create a valid subscription transaction', () {
      final transaction = Transaction.subscription(
        fundId: tFundId,
        amount: tAmount,
      );

      expect(transaction.id, isNotEmpty);
      expect(transaction.type, equals(TransactionType.subscription));
      expect(transaction.amount, equals(tAmount));
      expect(transaction.fundId, equals(tFundId));
      expect(transaction.syncStatus, equals(SyncStatus.pending.name));
      expect(transaction.date, isA<DateTime>());
    });

    test('Transaction.cancellation should create a valid cancellation transaction', () {
      final transaction = Transaction.cancellation(
        fundId: tFundId,
        amount: tAmount,
      );

      expect(transaction.id, isNotEmpty);
      expect(transaction.type, equals(TransactionType.cancellation));
      expect(transaction.amount, equals(tAmount));
      expect(transaction.fundId, equals(tFundId));
      expect(transaction.syncStatus, equals(SyncStatus.pending.name));
      expect(transaction.date, isA<DateTime>());
    });

    test('should support value equality', () {
      final date = DateTime(2026, 3, 29);
      final t1 = Transaction(
        id: '1',
        type: TransactionType.subscription,
        amount: 100.0,
        fundId: 'f1',
        date: date,
        syncStatus: 'pending',
      );
      final t2 = Transaction(
        id: '1',
        type: TransactionType.subscription,
        amount: 100.0,
        fundId: 'f1',
        date: date,
        syncStatus: 'pending',
      );

      expect(t1, equals(t2));
    });
  });

  group('TransactionResponse', () {
    test('should support value equality', () {
      const r1 = TransactionResponse(status: 'ok', message: 'done');
      const r2 = TransactionResponse(status: 'ok', message: 'done');

      expect(r1, equals(r2));
    });

    test('should hold correct values', () {
      const response = TransactionResponse(status: 'success', message: 'test');
      expect(response.status, 'success');
      expect(response.message, 'test');
    });
  });
}
