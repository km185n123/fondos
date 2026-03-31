import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';

void main() {
  group('TransactionDTO', () {
    final tDate = DateTime(2026, 3, 29);
    final tTransactionDto = TransactionDTO(
      id: '1',
      name: 'Fund 1',
      type: 'subscription',
      amount: 100.0,
      fundId: 'fund_1',
      date: tDate,
      syncStatus: 'pending',
    );

    final tJson = {
      'id': '1',
      'name': 'Fund 1',
      'type': 'subscription',
      'amount': 100.0,
      'fund_id': 'fund_1',
      'date': tDate.toIso8601String(),
      'sync_status': 'pending',
    };

    test('fromJson should return a valid model', () {
      final result = TransactionDTO.fromJson(tJson);
      expect(result, equals(tTransactionDto));
    });

    test('toJson should return a JSON map containing the proper data', () {
      final result = tTransactionDto.toJson();
      expect(result, equals(tJson));
    });
  });

  group('TransactionResponseDTO', () {
    const tTransactionResponseDto = TransactionResponseDTO(
      status: 'success',
      message: 'Transaction created successfully',
    );

    const tJson = {
      'status': 'success',
      'message': 'Transaction created successfully',
    };

    test('fromJson should return a valid model', () {
      final result = TransactionResponseDTO.fromJson(tJson);
      expect(result, equals(tTransactionResponseDto));
    });

    test('toJson should return a JSON map containing the proper data', () {
      final result = tTransactionResponseDto.toJson();
      expect(result, equals(tJson));
    });
  });
}
