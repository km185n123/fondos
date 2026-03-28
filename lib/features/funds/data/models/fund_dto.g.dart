// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundDTO _$FundDTOFromJson(Map<String, dynamic> json) => _FundDTO(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  montoMinimo: (json['monto_minimo'] as num).toDouble(),
  categoria: json['categoria'] as String,
);

Map<String, dynamic> _$FundDTOToJson(_FundDTO instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'monto_minimo': instance.montoMinimo,
  'categoria': instance.categoria,
};
