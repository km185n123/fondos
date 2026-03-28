import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fondos/features/funds/data/datasources/fund_api_service.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/error_messages.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late FundApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = FundApiService(mockDio);
  });

  group('FundApiService', () {
    final tFundJsonList = [
      {
        'id': '1',
        'nombre': 'Fondo 1',
        'monto_minimo': 100.0,
        'categoria': 'Acciones',
      }
    ];

    final tFundDtoList = [
      const FundDTO(
        id: '1',
        nombre: 'Fondo 1',
        montoMinimo: 100.0,
        categoria: 'Acciones',
      )
    ];

    test('should return a list of FundDTO when response is 200', () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
            data: tFundJsonList,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/funds'),
          ));

      // act
      final result = await apiService.getFunds();

      // assert
      expect(result, equals(tFundDtoList));
      verify(() => mockDio.get('/funds')).called(1);
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw ServerException when connection timeout occurs', () async {
      // arrange
      when(() => mockDio.get(any())).thenThrow(
        DioException(
            requestOptions: RequestOptions(path: '/funds'),
            type: DioExceptionType.connectionTimeout),
      );

      // act
      final call = apiService.getFunds;

      // assert
      expect(() => call(), throwsA(
        isA<ServerException>().having((e) => e.message, 'message', ErrorMessages.timeoutError),
      ));
    });
    
    test('should throw ServerException when other DioException occurs', () async {
      // arrange
      when(() => mockDio.get(any())).thenThrow(
        DioException(
            requestOptions: RequestOptions(path: '/funds'),
            type: DioExceptionType.badResponse),
      );

      // act
      final call = apiService.getFunds;

      // assert
      expect(() => call(), throwsA(
        isA<ServerException>().having((e) => e.message, 'message', ErrorMessages.networkError),
      ));
    });
    
    test('should throw ServerException when generic exception occurs', () async {
      // arrange
      when(() => mockDio.get(any())).thenThrow(Exception());

      // act
      final call = apiService.getFunds;

      // assert
      expect(() => call(), throwsA(
        isA<ServerException>().having((e) => e.message, 'message', ErrorMessages.unexpectedError),
      ));
    });
  });
}
