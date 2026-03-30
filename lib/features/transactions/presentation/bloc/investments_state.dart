import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investments_state.freezed.dart';

@freezed
class InvestmentsState with _$InvestmentsState {
  const factory InvestmentsState.initial() = _Initial;
  const factory InvestmentsState.loading() = _Loading;
  const factory InvestmentsState.success({
    required List<Transaction> investments,
    required double saldoActual,
  }) = _Success;
  const factory InvestmentsState.error(String message) = _Error;
}
