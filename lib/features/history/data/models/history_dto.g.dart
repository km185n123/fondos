// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryDto _$HistoryDtoFromJson(Map<String, dynamic> json) => _HistoryDto(
  title: json['title'] as String,
  amount: json['amount'] as String,
  isPositive: json['isPositive'] as bool,
);

Map<String, dynamic> _$HistoryDtoToJson(_HistoryDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'amount': instance.amount,
      'isPositive': instance.isPositive,
    };
