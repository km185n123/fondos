import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fondos/features/funds/domain/usecases/get_funds_usecase.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_event.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';

@injectable
class FundBloc extends Bloc<FundEvent, FundState> {
  final GetFundsUseCase getFundsUseCase;

  FundBloc({required this.getFundsUseCase}) : super(const FundState.initial()) {
    on<FundEvent>(_onGetFunds);
  }

  Future<void> _onGetFunds(FundEvent event, Emitter<FundState> emit) async {
    emit(const FundState.loading());

    final failureOrFunds = await getFundsUseCase.call();

    failureOrFunds.fold((failure) => emit(FundState.error(failure.message)), (
      funds,
    ) {
      final activeFunds = funds.toList();
      emit(FundState.success(funds: funds, activeFunds: activeFunds));
    });
  }
}
