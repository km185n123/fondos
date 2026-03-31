import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_dto.freezed.dart';
part 'history_dto.g.dart';

@freezed
abstract class HistoryDto with _$HistoryDto {
  const factory HistoryDto({
    required String title,
    required String amount,
    required bool isPositive,
  }) = _HistoryDto;

  factory HistoryDto.fromJson(Map<String, dynamic> json) =>
      _$HistoryDtoFromJson(json);
}
