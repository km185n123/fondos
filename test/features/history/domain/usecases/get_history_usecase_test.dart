import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/repositories/history_repository.dart';
import 'package:fondos/features/history/domain/usecases/get_history_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  late MockHistoryRepository mockHistoryRepository;
  late GetHistoryUseCase usecase;

  setUp(() {
    mockHistoryRepository = MockHistoryRepository();
    usecase = GetHistoryUseCase(mockHistoryRepository);
  });

  group('GetHistoryUseCase', () {
    test('should call historyRepository.watchHistory()', () {
      // arrange
      const tHistory = [History(title: 'T', amount: 'A', isPositive: true)];
      when(() => mockHistoryRepository.watchHistory())
          .thenAnswer((_) => Stream.fromIterable([const Right(tHistory)]));

      // act
      final result = usecase.call();

      // assert
      expect(result, isA<Stream<Either<dynamic, List<History>>>>());
      verify(() => mockHistoryRepository.watchHistory()).called(1);
    });
  });
}
