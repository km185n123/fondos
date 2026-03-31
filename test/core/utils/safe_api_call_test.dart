import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/core/utils/safe_api_call.dart';

void main() {
  group('SafeApiCall', () {
    test('should return data when apiCall is successful', () async {
      const tData = 'success';
      final result = await SafeApiCall.execute(() async => tData);
      expect(result, tData);
    });

    test('should throw NetworkException on Dio connection timeout', () async {
      expect(
        () => SafeApiCall.execute(() async {
          throw DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionTimeout,
          );
        }),
        throwsA(
          isA<NetworkException>().having(
            (e) => e.message,
            'message',
            ErrorMessages.timeoutError,
          ),
        ),
      );
    });

    test('should throw ServerException on badResponse with 500', () async {
      expect(
        () => SafeApiCall.execute(() async {
          throw DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 500,
            ),
          );
        }),
        throwsA(
          isA<ServerException>().having(
            (e) => e.message,
            'message',
            ErrorMessages.serverError,
          ),
        ),
      );
    });

    test('should throw NetworkException on generic error', () async {
      expect(
        () => SafeApiCall.execute(() async {
          throw Exception('Generic error');
        }),
        throwsA(
          isA<NetworkException>().having(
            (e) => e.message,
            'message',
            ErrorMessages.unexpectedError,
          ),
        ),
      );
    });
  });
}
