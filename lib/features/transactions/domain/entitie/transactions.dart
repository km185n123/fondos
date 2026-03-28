import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions.freezed.dart';

enum TransactionType { subscription, cancellation }

enum NotificationMethod { email, sms }

@freezed
abstract class Transactions with _$Transactions {
  const factory Transactions({
    required String id,
    required TransactionType type,
    required double amount,
    required String fundId,
    required DateTime date,
  }) = _Transactions;
}
