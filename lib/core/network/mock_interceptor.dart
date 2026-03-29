import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/// Mock interceptor that serves responses from local JSON assets.
///
/// Each JSON asset can include an optional `__mock__` envelope:
/// ```json
/// {
///   "__mock__": { "statusCode": 200 },
///   ... real response body fields ...
/// }
/// ```
/// - If `statusCode` is omitted it defaults to 200.
/// - If `statusCode` >= 400, the interceptor rejects with a [DioException]
///   so that `SafeApiCall` and error handling work as with a real API.
/// - The `__mock__` key is stripped before the body reaches the caller.
///
/// To switch a scenario edit only the JSON file — no Dart changes needed.
class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final cleanPath = options.path.startsWith('/')
          ? options.path.substring(1)
          : options.path;

      final resourcePath = 'assets/mocks/$cleanPath.json';
      final raw = await rootBundle.loadString(resourcePath);
      final decoded = json.decode(raw);

      int statusCode = 200;
      dynamic body = decoded;

      if (decoded is Map<String, dynamic> && decoded.containsKey('__mock__')) {
        final envelope = decoded['__mock__'] as Map<String, dynamic>;
        statusCode = (envelope['statusCode'] as int?) ?? 200;
        body = Map<String, dynamic>.from(decoded)..remove('__mock__');
      }

      await Future.delayed(const Duration(milliseconds: 500));

      if (statusCode >= 400) {
        return handler.reject(
          DioException(
            requestOptions: options,
            response: Response(
              requestOptions: options,
              data: body,
              statusCode: statusCode,
            ),
            type: DioExceptionType.badResponse,
          ),
        );
      }

      return handler.resolve(
        Response(requestOptions: options, data: body, statusCode: statusCode),
      );
    } catch (e) {
      return handler.next(options);
    }
  }
}
