import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/models/mappers/transaction_mappers.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';

void main() {
  group('TransactionMappers', () {
    final tDate = DateTime(2026, 3, 29);
    final tTransaction = Transaction(
      id: '1',
      type: TransactionType.subscription,
      amount: 100.0,
      fundId: 'fund_1',
      date: tDate,
      syncStatus: SyncStatus.pending.name,
    );

    test('toDb should map Transaction to TransactionDb correctly', () {
      final result = tTransaction.toDb();

      expect(result.id, tTransaction.id);
      expect(result.type, tTransaction.type.name);
      expect(result.amount, tTransaction.amount);
      expect(result.fundId, tTransaction.fundId);
      expect(result.date, tTransaction.date);
      expect(result.syncStatus, SyncStatus.pending.name);
    });

    test('toDto should map Transaction to TransactionDTO correctly', () {
      final result = tTransaction.toDto();

      expect(result.id, tTransaction.id);
      expect(result.type, tTransaction.type.name);
      expect(result.amount, tTransaction.amount);
      expect(result.fundId, tTransaction.fundId);
      expect(result.date, tTransaction.date);
      expect(result.syncStatus, SyncStatus.pending.name);
    });
  });

  group('TransactionResponseDTOMapper', () {
    const tResponseDto = TransactionResponseDTO(
      status: 'success',
      message: 'Done',
    );

    test('toEntity should map TransactionResponseDTO to TransactionResponse correctly', () {
      final result = tResponseDto.toEntity();

      expect(result.status, tResponseDto.status);
      expect(result.message, tResponseDto.message);
      expect(result, isA<TransactionResponse>());
    });
  });
}
