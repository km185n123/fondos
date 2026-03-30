import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'transaction.freezed.dart';

enum TransactionType { subscription, cancellation }

enum NotificationMethod { email, sms }

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String name,
    required TransactionType type,
    required double amount,
    required String fundId,
    required DateTime date,
    required String syncStatus,
  }) = _Transaction;

  factory Transaction.subscription({
    required String fundId,
    required double amount,
    required String name,
  }) {
    return Transaction(
      id: const Uuid().v4(),
      name: name,
      type: TransactionType.subscription,
      amount: amount,
      fundId: fundId,
      date: DateTime.now(),
      syncStatus: SyncStatus.pending.name,
    );
  }

  factory Transaction.cancellation({
    required String fundId,
    required double amount,
    required String name,
  }) {
    return Transaction(
      id: const Uuid().v4(),
      name: name,
      type: TransactionType.cancellation,
      amount: amount,
      fundId: fundId,
      date: DateTime.now(),
      syncStatus: SyncStatus.pending.name,
    );
  }
}
