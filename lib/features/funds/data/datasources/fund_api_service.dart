import 'package:dio/dio.dart';
import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FundApiService {
  final Dio _dio;

  FundApiService(this._dio);

  Future<List<FundDTO>> getFunds() async {
    try {
      final response = await _dio.get('/funds');

      final data = response.data as List<dynamic>;
      return data
          .map((json) => FundDTO.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ServerException(ErrorMessages.timeoutError);
      }
      throw ServerException(ErrorMessages.networkError);
    } catch (e) {
      throw ServerException(ErrorMessages.unexpectedError);
    }
  }
}
