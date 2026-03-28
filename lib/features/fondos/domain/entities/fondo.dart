import 'package:freezed_annotation/freezed_annotation.dart';

part 'fondo.freezed.dart';

@freezed
abstract class Fondo with _$Fondo {
  const factory Fondo({
    required String id,
    required String nombre,
    required double montoMinimo,
    required String categoria,
  }) = _Fondo;
}
