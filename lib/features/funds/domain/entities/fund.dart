import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund.freezed.dart';

@freezed
abstract class Fund with _$Fund {
  const Fund._();

  const factory Fund({
    required String id,
    required String nombre,
    required double montoMinimo,
    required String categoria,
  }) = _Fund;

  bool canSubscribe(double amount) {
    return amount >= montoMinimo;
  }
}
