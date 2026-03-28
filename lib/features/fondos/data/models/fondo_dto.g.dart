// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fondo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FondoDTO _$FondoDTOFromJson(Map<String, dynamic> json) => _FondoDTO(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  montoMinimo: (json['monto_minimo'] as num).toDouble(),
  categoria: json['categoria'] as String,
);

Map<String, dynamic> _$FondoDTOToJson(_FondoDTO instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'monto_minimo': instance.montoMinimo,
  'categoria': instance.categoria,
};
