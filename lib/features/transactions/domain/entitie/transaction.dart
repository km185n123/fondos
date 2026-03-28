import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

enum TransactionType { subscription, cancellation }

enum NotificationMethod { email, sms }

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required TransactionType type,
    required double amount,
    required String fundId,
    required DateTime date,
  }) = _Transaction;
}
