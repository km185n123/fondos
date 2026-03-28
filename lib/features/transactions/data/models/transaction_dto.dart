import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class TransactionDTO with _$TransactionDTO {
  const factory TransactionDTO({
    required String id,
    required String type,
    required double amount,
    @JsonKey(name: 'fund_id') required String fundId,
    required DateTime date,
  }) = _TransactionDTO;

  factory TransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$TransactionDTOFromJson(json);

  const TransactionDTO._();
}
