import 'package:funds/features/funds/domain/entities/fund.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_dto.freezed.dart';
part 'fund_dto.g.dart';

@freezed
abstract class FundDTO with _$FundDTO {
  const factory FundDTO({
    required String id,
    required String nombre,
    @JsonKey(name: 'monto_minimo') required double montoMinimo,
    required String categoria,
  }) = _FundDTO;

  factory FundDTO.fromJson(Map<String, dynamic> json) =>
      _$FundDTOFromJson(json);

  const FundDTO._();

  Fund toDomain() {
    return Fund(
      id: id,
      nombre: nombre,
      montoMinimo: montoMinimo,
      categoria: categoria,
    );
  }
}
