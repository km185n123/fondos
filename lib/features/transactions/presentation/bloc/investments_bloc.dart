import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/transactions/domain/usecases/get_investments_use_case.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class InvestmentsBloc extends Bloc<InvestmentsEvent, InvestmentsState> {
  final GetInvestmentsUseCase getInvestmentsUseCase;

  InvestmentsBloc({required this.getInvestmentsUseCase})
    : super(const InvestmentsState.initial()) {
    on<InvestmentsEvent>((event, emit) async {
      await event.when(getInvestments: () async => _onGetInvestments(emit));
    });
  }

  Future<void> _onGetInvestments(Emitter<InvestmentsState> emit) async {
    emit(const InvestmentsState.loading());

    final result = await getInvestmentsUseCase.call();

    result.fold((failure) => emit(InvestmentsState.error(failure.message)), (
      transactions,
    ) {
      final total = transactions.fold<double>(0, (prev, e) => prev + e.amount);

      emit(
        InvestmentsState.success(investments: transactions, saldoActual: total),
      );
    });
  }
}
