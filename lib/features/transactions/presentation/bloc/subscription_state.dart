import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_state.freezed.dart';

enum SubscriptionStatus { initial, loading, success, error }

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(SubscriptionStatus.initial) SubscriptionStatus status,
    Fund? selectedFund,
    @Default(0.0) double amount,
    @Default(12450000.0) double availableBalance,
    NotificationMethod? notificationMethod,
    String? errorMessage,
    String? amountError, // field-level error shown below the input
  }) = _SubscriptionState;
}
