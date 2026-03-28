import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funds/features/funds/domain/usecases/get_funds_usecase.dart';
import 'fund_event.dart';
import 'fund_state.dart';

class FundBloc extends Bloc<FundEvent, FundState> {
  final GetFundsUseCase getFundsUseCase;

  FundBloc({required this.getFundsUseCase})
    : super(const FundState.initial()) {
    on<FundEvent>(_onGetFunds);
  }

  Future<void> _onGetFunds(FundEvent event, Emitter<FundState> emit) async {
    emit(const FundState.loading());

    try {
      final funds = await getFundsUseCase.call();

      emit(FundState.success(funds: funds));
    } catch (e) {
      emit(
        FundState.error(
          'Ocurrió un error al cargar los funds. Verifica tu conexión.',
        ),
      );
    }
  }
}
