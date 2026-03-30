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
      name: name,
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
      name: name,
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

extension TransactionDbMapper on TransactionDb {
  Transaction toEntity() {
    return Transaction(
      id: id,
      name: name,
      type: TransactionType.values.firstWhere((e) => e.name == type),
      amount: amount,
      fundId: fundId,
      date: date,
      syncStatus: syncStatus,
    );
  }
}
