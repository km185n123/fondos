import 'package:fondos/core/enum/syncs_tatus.dart';
import 'package:fondos/features/transactions/data/models/mappers/transaction_mappers.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/core/utils/safe_call.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_api_service.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDao transactionDao;
  final UserDao userDao;
  final TransactionApiService apiService;

  TransactionRepositoryImpl({
    required this.transactionDao,
    required this.userDao,
    required this.apiService,
  });

  @override
  Future<Either<Failure, TransactionResponse>> subscribeFund({
    required Transaction transaction,
  }) {
    return SafeCall.execute<TransactionResponse>(
      tryBlock: () async {
        await transactionDao.runInTransaction(() async {
          final balance = await userDao.getBalance();

          if (balance < transaction.amount) {
            throw Exception('INSUFFICIENT_BALANCE');
          }

          final newBalance = balance - transaction.amount;

          await userDao.updateBalance(newBalance);

          await transactionDao.insertTransaction(
            transaction.toDb().copyWith(syncStatus: SyncStatus.pending.name),
          );
        });

        final response = await _trySync(transaction);

        await transactionDao.updateSyncStatus(
          transaction.id,
          SyncStatus.synced,
        );

        return response;
      },
    );
  }

  Future<TransactionResponse> _trySync(Transaction transaction) async {
    final dto = transaction.toDto();
    final responseDto = await apiService.createTransaction(dto);
    return responseDto.toEntity();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getInvestments() {
    return SafeCall.execute<List<Transaction>>(
      tryBlock: () async {
        final transactions = await transactionDao.getInvestments();
        return transactions.map((e) => e.toEntity()).toList();
      },
    );
  }
}
