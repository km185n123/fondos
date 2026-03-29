// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionDTO _$TransactionDTOFromJson(Map<String, dynamic> json) =>
    _TransactionDTO(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      fundId: json['fund_id'] as String,
      date: DateTime.parse(json['date'] as String),
      syncStatus: json['sync_status'] as String,
    );

Map<String, dynamic> _$TransactionDTOToJson(_TransactionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'fund_id': instance.fundId,
      'date': instance.date.toIso8601String(),
      'sync_status': instance.syncStatus,
    };
