import 'package:fondos/core/errors/error_messages.dart';

class ServerException implements Exception {
  final String message;
  ServerException([this.message = ErrorMessages.serverError]);
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = ErrorMessages.cacheError]);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = ErrorMessages.networkError]);
}

class BusinessException implements Exception {
  final String message;
  BusinessException([this.message = ErrorMessages.businessError]);
}
