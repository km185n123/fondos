import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fondos/features/funds/data/datasources/fund_api_service.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/funds/data/repositories/fund_repository_impl.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/user/domain/repositories/user_repository.dart';

class MockFundApiService extends Mock implements FundApiService {}

class MockFundDao extends Mock implements FundDao {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late FundRepositoryImpl repository;
  late MockFundApiService mockApiService;
  late MockUserRepository mockUserRepository;
  late MockFundDao mockDao;

  setUp(() {
    mockApiService = MockFundApiService();
    mockDao = MockFundDao();
    mockUserRepository = MockUserRepository();
    repository = FundRepositoryImpl(
      userRepository: mockUserRepository,
      apiService: mockApiService,
      fundDao: mockDao,
    );

    registerFallbackValue(
      const FundDb(
        id: 'dummy',
        name: 'dummy',
        minimumAmount: 0,
        category: 'dummy',
      ),
    );
  });

  group('FundRepositoryImpl', () {
    final tFundDtoList = [
      const FundDTO(
        id: '1',
        name: 'Fondo Test',
        minimumAmount: 100.0,
        category: 'Crypto',
      ),
    ];

    final tFundDbList = [
      const FundDb(
        id: '1',
        name: 'Fondo Test',
        minimumAmount: 100.0,
        category: 'Crypto',
      ),
    ];

    final tFundDomainList = [
      const Fund(
        id: '1',
        name: 'Fondo Test',
        minimumAmount: 100.0,
        category: 'Crypto',
      ),
    ];

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(
          () => mockApiService.getFunds(),
        ).thenAnswer((_) async => tFundDtoList);
        when(
          () => mockDao.synchronizeFunds(any()),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getFunds();

        // assert
        verify(() => mockApiService.getFunds()).called(1);
        verify(() => mockDao.synchronizeFunds(any())).called(1);
        expect(result.getRight().toNullable(), equals(tFundDomainList));
      },
    );

    test(
      'should fall back to local data when remote data source throws ServerException',
      () async {
        // arrange
        when(() => mockApiService.getFunds()).thenThrow(ServerException());
        when(() => mockDao.getFunds()).thenAnswer((_) async => tFundDbList);

        // act
        final result = await repository.getFunds();

        // assert
        verify(() => mockApiService.getFunds()).called(1);
        verify(() => mockDao.getFunds()).called(1);
        verifyNever(() => mockDao.synchronizeFunds(any()));
        expect(result.getRight().toNullable(), equals(tFundDomainList));
      },
    );

    test(
      'should return CacheFailure when remote throws ServerException and local throws CacheException',
      () async {
        // arrange
        when(() => mockApiService.getFunds()).thenThrow(ServerException());
        when(() => mockDao.getFunds()).thenAnswer(
          (_) async => [],
        ); // _fetchLocal throws CacheException on empty

        // act
        final result = await repository.getFunds();

        // assert
        expect(result.getLeft().toNullable(), isA<CacheFailure>());
      },
    );
  });
}
