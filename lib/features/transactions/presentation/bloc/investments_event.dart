import 'package:freezed_annotation/freezed_annotation.dart';

part 'investments_event.freezed.dart';

@freezed
abstract class InvestmentsEvent with _$InvestmentsEvent {
  const factory InvestmentsEvent.getInvestments() = _GetInvestments;
}
