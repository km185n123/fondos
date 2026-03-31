import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/history/data/datasource/history_dao.dart';
import 'package:fondos/features/history/data/repositories/history_respository_impl.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockHistoryDao extends Mock implements HistoryDao {}

void main() {
  late MockHistoryDao mockHistoryDao;
  late HistoryRepositoryImpl repository;

  setUp(() {
    mockHistoryDao = MockHistoryDao();
    repository = HistoryRepositoryImpl(mockHistoryDao);
  });

  setUpAll(() {
    registerFallbackValue(
      const HistoryTablesCompanion(
        title: Value('title'),
        amount: Value('amount'),
        isPositive: Value(true),
      ),
    );
  });

  group('HistoryRepositoryImpl', () {
    const tHistory = History(
      title: 'Title',
      amount: '10.0',
      isPositive: true,
    );

    test('insertHistory should call historyDao.insertHistory()', () async {
      // arrange
      when(() => mockHistoryDao.insertHistory(any())).thenAnswer((_) async => 1);

      // act
      final result = await repository.insertHistory(tHistory);

      // assert
      expect(result, const Right(null));
      verify(() => mockHistoryDao.insertHistory(any())).called(1);
    });

    test('watchHistory should return stream of Right(List<History>)', () async {
      // arrange
      const tableRow = HistoryTable(
        id: 1,
        title: 'Title',
        amount: '10.0',
        isPositive: true,
      );
      when(() => mockHistoryDao.watchAll()).thenAnswer((_) => Stream.fromIterable([[tableRow]]));

      // act
      final result = repository.watchHistory();

      // assert
      final emission = await result.first;
      
      emission.fold(
        (l) => fail('Should be Right'),
        (r) => expect(r, equals(const [tHistory])),
      );
      verify(() => mockHistoryDao.watchAll()).called(1);
    });
  });
}
