import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_api_service.dart';
import 'package:fondos/features/transactions/data/models/transaction_dto.dart';
import 'package:fondos/features/transactions/data/models/transaction_response_dto.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/error_messages.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late TransactionApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = TransactionApiService(mockDio);
  });

  group('TransactionApiService', () {
    final tDate = DateTime(2026, 3, 29);
    final tTransactionDto = TransactionDTO(
      id: '1',
      type: 'subscription',
      amount: 100.0,
      fundId: 'fund_1',
      date: tDate,
      syncStatus: 'pending',
    );

    const tResponseDto = TransactionResponseDTO(
      status: 'success',
      message: 'Transaction created',
    );

    final tResponseJson = {
      'status': 'success',
      'message': 'Transaction created',
    };

    test('should return TransactionResponseDTO when post is successful', () async {
      // arrange
      when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          data: tResponseJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/transactions'),
        ),
      );

      // act
      final result = await apiService.createTransaction(tTransactionDto);

      // assert
      expect(result, equals(tResponseDto));
      verify(() => mockDio.post(any(), data: tTransactionDto.toJson())).called(1);
    });

    test('should throw ServerException when badResponse occurs (e.g. 400)', () async {
      // arrange
      when(() => mockDio.post(any(), data: any(named: 'data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/transactions'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/transactions'),
            statusCode: 400,
          ),
        ),
      );

      // act
      final call = apiService.createTransaction(tTransactionDto);

      // assert
      expect(() => call, throwsA(isA<ServerException>().having((e) => e.message, 'message', ErrorMessages.badRequest)));
    });

    test('should throw NetworkException when connection timeout occurs', () async {
      // arrange
      when(() => mockDio.post(any(), data: any(named: 'data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/transactions'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      // act
      final call = apiService.createTransaction(tTransactionDto);

      // assert
      expect(() => call, throwsA(isA<NetworkException>().having((e) => e.message, 'message', ErrorMessages.timeoutError)));
    });
  });
}
