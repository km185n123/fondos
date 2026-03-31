// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundDTO _$FundDTOFromJson(Map<String, dynamic> json) => _FundDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  minimumAmount: (json['minimumAmount'] as num).toDouble(),
  category: json['category'] as String,
);

Map<String, dynamic> _$FundDTOToJson(_FundDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'minimumAmount': instance.minimumAmount,
  'category': instance.category,
};
