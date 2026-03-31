import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';

@freezed
abstract class History with _$History {
  const factory History({
    required String title,
    required String amount,
    required bool isPositive,
  }) = _History;
}
