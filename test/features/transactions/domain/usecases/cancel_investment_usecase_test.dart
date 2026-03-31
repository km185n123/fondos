import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/transaction_type.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/repositories/history_repository.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:fondos/features/transactions/domain/usecases/cancel_investment_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}
class MockHistoryRepository extends Mock implements HistoryRepository {}
class MockTransaction extends Mock implements Transaction {}

void main() {
  late MockTransactionRepository mockTransactionRepository;
  late MockHistoryRepository mockHistoryRepository;
  late CancelInvestmentUseCase usecase;

  setUpAll(() {
    registerFallbackValue(MockTransaction());
    registerFallbackValue(
      const History(
        title: '',
        amount: '',
        isPositive: false,
      ),
    );
  });

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    mockHistoryRepository = MockHistoryRepository();
    usecase = CancelInvestmentUseCase(mockTransactionRepository, mockHistoryRepository);
  });

  group('CancelInvestmentUseCase', () {
    final tTransaction = Transaction(
      id: '1',
      name: 'Fund 1',
      type: TransactionType.subscription,
      amount: 100.0,
      fundId: 'fund_1',
      date: DateTime.now(),
      syncStatus: 'pending',
    );

    test('should call transactionRepository.cancelInvestment() and insertHistory()', () async {
      // arrange
      when(() => mockTransactionRepository.cancelInvestment(any()))
          .thenAnswer((_) async => const Right(true));
      when(() => mockHistoryRepository.insertHistory(any()))
          .thenAnswer((_) async => const Right(null));

      // act
      final result = await usecase.call(tTransaction);

      // assert
      expect(result, const Right(true));
      verify(() => mockTransactionRepository.cancelInvestment(tTransaction)).called(1);
      verify(() => mockHistoryRepository.insertHistory(any())).called(1);
    });

    test('should return failure if repository fails', () async {
      // arrange
      // failure case
    });
  });
}
