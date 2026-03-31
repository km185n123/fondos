import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:fondos/features/funds/domain/usecases/get_funds_usecase.dart';

class MockFundRepository extends Mock implements FundRepository {}

void main() {
  late GetFundsUseCase useCase;
  late MockFundRepository mockRepository;

  setUp(() {
    mockRepository = MockFundRepository();
    useCase = GetFundsUseCase(mockRepository);
  });

  group('GetFundsUseCase', () {
    final tFundList = [
      const Fund(
        id: '1',
        name: 'Fondo',
        minimumAmount: 10.0,
        category: 'Categoría 1',
      ),
    ];

    test('should get a list of funds from the repository', () async {
      // arrange
      when(
        () => mockRepository.getFunds(),
      ).thenAnswer((_) async => Right(tFundList));

      // act
      final result = await useCase();

      // assert
      expect(result, Right(tFundList));
      verify(() => mockRepository.getFunds()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Server Error');
      when(
        () => mockRepository.getFunds(),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase();

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.getFunds()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
