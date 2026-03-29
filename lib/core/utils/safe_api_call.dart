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
      throw NetworkException(ErrorMessages.unexpectedError);
    }
  }

  static Exception _mapDioException(DioException e) {
    switch (e.type) {
      // Network/connectivity issues
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(ErrorMessages.timeoutError);

      case DioExceptionType.cancel:
        return NetworkException(ErrorMessages.requestCancelled);

      // Server responded with 4xx / 5xx
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        final msg = statusCode >= 500
            ? ErrorMessages.serverError
            : ErrorMessages.badRequest;
        return ServerException(msg);

      // Unknown (no internet, DNS fail, etc.)
      case DioExceptionType.unknown:
      default:
        return NetworkException(ErrorMessages.networkError);
    }
  }
}
