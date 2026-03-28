import 'package:fondos/features/fondos/domain/entities/fondo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fondo_dto.freezed.dart';
part 'fondo_dto.g.dart';

@freezed
abstract class FondoDTO with _$FondoDTO {
  const factory FondoDTO({
    required String id,
    required String nombre,
    @JsonKey(name: 'monto_minimo') required double montoMinimo,
    required String categoria,
  }) = _FondoDTO;

  factory FondoDTO.fromJson(Map<String, dynamic> json) =>
      _$FondoDTOFromJson(json);

  const FondoDTO._(); // Constructor privado necesario para definir métodos personalizados

  // Método para mapear el DTO a la Entidad de Dominio
  Fondo toDomain() {
    return Fondo(
      id: id,
      nombre: nombre,
      montoMinimo: montoMinimo,
      categoria: categoria,
    );
  }
}
