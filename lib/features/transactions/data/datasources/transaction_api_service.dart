import 'package:dio/dio.dart';
import 'package:fondos/core/utils/safe_api_call.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransactionApiService {
  final Dio _dio;

  TransactionApiService(this._dio);

  Future<void> createTransaction(TransactionDTO transaction) {
    return SafeApiCall.execute(
      () => _dio.post('/transacciones', data: transaction.toJson()),
    );
  }
}
