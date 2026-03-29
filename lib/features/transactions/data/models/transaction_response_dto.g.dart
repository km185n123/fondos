// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponseDTO _$TransactionResponseDTOFromJson(
  Map<String, dynamic> json,
) => _TransactionResponseDTO(
  status: json['status'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$TransactionResponseDTOToJson(
  _TransactionResponseDTO instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
