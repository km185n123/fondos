import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:fondos/features/funds/domain/usecases/watch_current_balance_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockFundRepository extends Mock implements FundRepository {}

void main() {
  late MockFundRepository mockFundRepository;
  late WatchCurrentBalanceUseCase usecase;

  setUp(() {
    mockFundRepository = MockFundRepository();
    usecase = WatchCurrentBalanceUseCase(repository: mockFundRepository);
  });

  group('WatchCurrentBalanceUseCase', () {
    test('should call fundRepository.watchCurrentBalance()', () {
      // arrange
      when(() => mockFundRepository.watchCurrentBalance())
          .thenAnswer((_) => Stream.fromIterable([const Right(500.0)]));

      // act
      final result = usecase.call();

      // assert
      expect(result, isA<Stream<Either<dynamic, double>>>());
      verify(() => mockFundRepository.watchCurrentBalance()).called(1);
    });
  });
}
