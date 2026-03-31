import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';

void main() {
  group('TransactionResponseDTO', () {
    test('should create correctly from JSON', () {
      final json = {
        'status': 'success',
        'message': 'Transaction complete',
      };

      final dto = TransactionResponseDTO.fromJson(json);

      expect(dto.status, 'success');
      expect(dto.message, 'Transaction complete');
    });

    test('should convert to JSON correctly', () {
      const dto = TransactionResponseDTO(
        status: 'success',
        message: 'Transaction complete',
      );

      final json = dto.toJson();

      expect(json['status'], 'success');
      expect(json['message'], 'Transaction complete');
    });
  });
}
