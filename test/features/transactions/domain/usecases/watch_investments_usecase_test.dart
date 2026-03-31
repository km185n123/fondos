import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/transactions/domain/usecases/watch_investments_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late MockTransactionRepository mockTransactionRepository;
  late WatchInvestmentsUseCase usecase;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    usecase = WatchInvestmentsUseCase(mockTransactionRepository);
  });

  group('WatchInvestmentsUseCase', () {
    test('should call transactionRepository.watchInvestments()', () {
      // arrange
      final tTransactions = <Transaction>[];
      when(() => mockTransactionRepository.watchInvestments())
          .thenAnswer((_) => Stream.fromIterable([tTransactions]));

      // act
      final result = usecase.call();

      // assert
      expect(result, isA<Stream<List<Transaction>>>());
      verify(() => mockTransactionRepository.watchInvestments()).called(1);
    });
  });
}
