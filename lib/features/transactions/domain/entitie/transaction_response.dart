import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    required String status,
    required String message,
  }) = _TransactionResponse;
}
