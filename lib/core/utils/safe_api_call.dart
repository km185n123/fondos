import 'package:dio/dio.dart';
import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/core/errors/exceptions.dart';

class SafeApiCall {
  static Future<T> execute<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      throw _mapDioException(e);
    } catch (_) {
      throw ServerException(ErrorMessages.unexpectedError);
    }
  }

  static ServerException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException(ErrorMessages.timeoutError);

      case DioExceptionType.badResponse:
        return ServerException(ErrorMessages.serverError);

      case DioExceptionType.cancel:
        return ServerException(ErrorMessages.requestCancelled);

      case DioExceptionType.unknown:
      default:
        return ServerException(ErrorMessages.networkError);
    }
  }
}
