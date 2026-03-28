import 'package:fondos/features/transactions/data/models/mappers/transaction_mappers.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/core/utils/safe_call.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_api_service.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDao transactionDao;
  final TransactionApiService apiService;

  TransactionRepositoryImpl({
    required this.transactionDao,
    required this.apiService,
  });

  @override
  Future<Either<Failure, Unit>> registerTransaction(Transaction transaction) {
    return SafeCall.execute<Unit>(
      tryBlock: () async {
        await _saveLocal(transaction);
        await _trySync(transaction);
        return unit;
      },
    );
  }

  Future<void> _saveLocal(Transaction transaction) async {
    final dbModel = transaction.toDb();
    await transactionDao.insertTransaction(dbModel);
  }

  Future<void> _trySync(Transaction transaction) async {
    final dto = transaction.toDto();

    try {
      await apiService.createTransaction(dto);
    } catch (_) {
      // intentionally silent: offline-first
      // TODO: enqueue for retry sync
    }
  }
}
