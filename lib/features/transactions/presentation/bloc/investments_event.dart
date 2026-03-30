import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investments_event.freezed.dart';

@freezed
class InvestmentsEvent with _$InvestmentsEvent {
  const factory InvestmentsEvent.startWatching() = _StartWatching;
  const factory InvestmentsEvent.onData(List<Transaction> data) = _OnData;
}
