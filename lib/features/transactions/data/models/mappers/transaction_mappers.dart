import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';

extension TransactionMappers on Transaction {
  TransactionDb toDb() {
    return TransactionDb(
      id: id,
      type: type.name,
      amount: amount,
      fundId: fundId,
      date: date,
    );
  }

  TransactionDTO toDto() {
    return TransactionDTO(
      id: id,
      type: type.name,
      amount: amount,
      fundId: fundId,
      date: date,
    );
  }
}
