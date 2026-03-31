import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';
import 'package:fondos/features/history/domain/usecases/get_history_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'history_bloc.freezed.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.watchHistory() = _WatchHistory;
}

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.success(List<History> history) = _Success;
  const factory HistoryState.error(String message) = _Error;
}

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistoryUseCase getHistoryUseCase;

  HistoryBloc({required this.getHistoryUseCase}) : super(const HistoryState.initial()) {
    on<HistoryEvent>((event, emit) async {
      await event.when(
        watchHistory: () => _onWatchHistory(emit),
      );
    });
  }

  Future<void> _onWatchHistory(Emitter<HistoryState> emit) async {
    emit(const HistoryState.loading());
    await emit.forEach(
      getHistoryUseCase.call(),
      onData: (result) => result.fold(
        (failure) => HistoryState.error(failure.toString()),
        (history) => HistoryState.success(history),
      ),
      onError: (error, stackTrace) => HistoryState.error(error.toString()),
    );
  }
}
