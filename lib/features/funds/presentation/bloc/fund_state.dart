import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

part 'fund_state.freezed.dart';

@freezed
class FundState with _$FundState {
  const factory FundState.initial() = _Initial;
  const factory FundState.loading() = _Loading;
  const factory FundState.success({
    required List<Fund> funds,
    @Default(500000.0) double saldoActual,
  }) = _Success;
  const factory FundState.error(String message) = _Error;
}
