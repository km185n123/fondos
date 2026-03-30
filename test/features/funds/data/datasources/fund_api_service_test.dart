import 'package:dio/dio.dart';
import 'package:fondos/core/network/api_paths.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fondos/features/funds/data/datasources/fund_api_service.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:fondos/core/errors/exceptions.dart';

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
        'name': 'Fondo 1',
        'minimumAmount': 100.0,
        'category': 'Acciones',
      },
    ];

    final tFundDtoList = [
      const FundDTO(
        id: '1',
        name: 'Fondo 1',
        minimumAmount: 100.0,
        category: 'Acciones',
      ),
    ];

    test('should return a list of FundDTO when response is 200', () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: {'data': tFundJsonList},
          statusCode: 200,
          requestOptions: RequestOptions(path: ApiPaths.funds),
        ),
      );

      // act
      final result = await apiService.getFunds();

      // assert
      expect(result, equals(tFundDtoList));
      verify(() => mockDio.get(ApiPaths.funds)).called(1);
      verifyNoMoreInteractions(mockDio);
    });

    test(
      'should delegate exception handling to SafeApiCall when Dio error occurs',
      () async {
        // arrange: we don't test EACH dio error here because it's tested in safe_api_call_test.dart
        when(() => mockDio.get(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiPaths.funds),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // act
        final call = apiService.getFunds;

        // assert: we only verify that a NetworkException is rethrown (SafeApiCall logic)
        expect(() => call(), throwsA(isA<NetworkException>()));
      },
    );
  });
}
