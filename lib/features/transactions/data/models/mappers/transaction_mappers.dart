import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';

extension TransactionMappers on Transaction {
  TransactionDb toDb() {
    return TransactionDb(
      id: id,
      type: type.name,
      amount: amount,
      fundId: fundId,
      date: date,
      syncStatus: SyncStatus.pending.name,
    );
  }

  TransactionDTO toDto() {
    return TransactionDTO(
      id: id,
      type: type.name,
      amount: amount,
      fundId: fundId,
      date: date,
      syncStatus: SyncStatus.pending.name,
    );
  }
}

extension TransactionResponseDTOMapper on TransactionResponseDTO {
  TransactionResponse toEntity() {
    return TransactionResponse(status: status, message: message);
  }
}
