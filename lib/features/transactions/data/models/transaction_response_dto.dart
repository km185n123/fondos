import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response_dto.freezed.dart';
part 'transaction_response_dto.g.dart';

@freezed
abstract class TransactionResponseDTO with _$TransactionResponseDTO {
  const factory TransactionResponseDTO({
    required String status,
    required String message,
  }) = _TransactionResponseDTO;

  factory TransactionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseDTOFromJson(json);

  const TransactionResponseDTO._();
}
