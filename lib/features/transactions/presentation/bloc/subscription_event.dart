import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_event.freezed.dart';

@freezed
abstract class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.selectFund(Fund fund) = _SelectFund;
  const factory SubscriptionEvent.changeAmount(double amount) = _ChangeAmount;
  const factory SubscriptionEvent.changeNotificationMethod(
    NotificationMethod method,
  ) = _ChangeNotificationMethod;
  const factory SubscriptionEvent.confirm() = _Confirm;
  const factory SubscriptionEvent.cancel(Transaction transaction) = _Cancel;
}
