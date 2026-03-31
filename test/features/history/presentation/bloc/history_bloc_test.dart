import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/usecases/get_history_usecase.dart';
import 'package:fondos/features/history/presentation/bloc/history_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MockGetHistoryUseCase extends Mock implements GetHistoryUseCase {}

void main() {
  late MockGetHistoryUseCase mockGetHistoryUseCase;

  setUp(() {
    mockGetHistoryUseCase = MockGetHistoryUseCase();
  });

  group('HistoryBloc', () {
    const tHistory = [History(title: 'T', amount: 'A', isPositive: true)];

    blocTest<HistoryBloc, HistoryState>(
      'emits [loading, success] when watchHistory is added and usecase returns success',
      build: () {
        when(() => mockGetHistoryUseCase.call())
            .thenAnswer((_) => Stream.fromIterable([const Right(tHistory)]));
        return HistoryBloc(getHistoryUseCase: mockGetHistoryUseCase);
      },
      act: (bloc) => bloc.add(const HistoryEvent.watchHistory()),
      expect: () => [
        const HistoryState.loading(),
        const HistoryState.success(tHistory),
      ],
      verify: (_) {
        verify(() => mockGetHistoryUseCase.call()).called(1);
      },
    );

    blocTest<HistoryBloc, HistoryState>(
      'emits [loading, error] when watchHistory is added and usecase returns failure',
      build: () {
        when(() => mockGetHistoryUseCase.call())
            .thenAnswer((_) => Stream.fromIterable([const Left(ServerFailure('error'))]));
        return HistoryBloc(getHistoryUseCase: mockGetHistoryUseCase);
      },
      act: (bloc) => bloc.add(const HistoryEvent.watchHistory()),
      expect: () => [
        const HistoryState.loading(),
        const HistoryState.error('ServerFailure(error)'),
      ],
    );
  });
}
