import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

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

      final data = await rootBundle.loadString(resourcePath);
      final jsonResult = json.decode(data);

      final result = (jsonResult is Map && jsonResult.containsKey(cleanPath))
          ? jsonResult[cleanPath]
          : jsonResult;

      await Future.delayed(const Duration(milliseconds: 500));

      return handler.resolve(
        Response(requestOptions: options, data: result, statusCode: 200),
      );
    } catch (e) {
      return handler.next(options);
    }
  }
}
