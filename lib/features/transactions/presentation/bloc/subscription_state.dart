import 'package:fondos/core/enum/notification_method.dart';
import 'package:fondos/core/enum/subscription_status.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_state.freezed.dart';

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(SubscriptionStatus.initial) SubscriptionStatus status,
    Fund? selectedFund,
    @Default(0.0) double amount,
    @Default(12450000.0) double availableBalance,
    @Default(NotificationMethod.email) NotificationMethod notificationMethod,
    String? errorMessage,
    String? amountError,
  }) = _SubscriptionState;
}
