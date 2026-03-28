import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/funds/domain/usecases/get_funds_usecase.dart';
import 'fund_event.dart';
import 'fund_state.dart';

class FundBloc extends Bloc<FundEvent, FundState> {
  final GetFundsUseCase getFundsUseCase;

  FundBloc({required this.getFundsUseCase}) : super(const FundState.initial()) {
    on<FundEvent>(_onGetFunds);
  }

  Future<void> _onGetFunds(FundEvent event, Emitter<FundState> emit) async {
    emit(const FundState.loading());

    final failureOrFunds = await getFundsUseCase.call();

    failureOrFunds.fold(
      (failure) => emit(FundState.error(failure.message)),
      (funds) => emit(FundState.success(funds: funds)),
    );
  }
}
