import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_event.freezed.dart';

@freezed
class FundEvent with _$FundEvent {
  const factory FundEvent.getFunds() = _GetFunds;
}
