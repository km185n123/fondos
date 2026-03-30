import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fondos/features/funds/domain/usecases/get_funds_usecase.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_event.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';
import 'package:fondos/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fondos/features/funds/domain/usecases/watch_current_balance_usecase.dart';

@injectable
class FundBloc extends Bloc<FundEvent, FundState> {
  final GetFundsUseCase getFundsUseCase;
  final WatchCurrentBalanceUseCase watchCurrentBalance;

  FundBloc({required this.getFundsUseCase, required this.watchCurrentBalance})
    : super(const FundState.initial()) {
    on<FundEvent>((event, emit) async {
      await event.when(
        getFunds: () => _onGetFunds(emit),
        watchBalance: () => _onWatchBalance(emit),
      );
    });
  }

  Future<void> _onGetFunds(Emitter<FundState> emit) async {
    emit(const FundState.loading());

    final failureOrFunds = await getFundsUseCase.call();

    failureOrFunds.fold((failure) => emit(FundState.error(failure.message)), (
      funds,
    ) {
      final currentBalance = state.maybeWhen(
        success: (_, balance) => balance,
        orElse: () => 500000.0,
      );
      emit(FundState.success(funds: funds, currentBalance: currentBalance));
    });
  }

  Future<void> _onWatchBalance(Emitter<FundState> emit) async {
    await emit.forEach<Either<Failure, double>>(
      watchCurrentBalance(),
      onData: (failureOrBalance) {
        return failureOrBalance.fold(
          (failure) => FundState.error(failure.message),
          (balance) {
            return state.maybeWhen(
              success: (funds, _) =>
                  FundState.success(funds: funds, currentBalance: balance),
              orElse: () =>
                  FundState.success(funds: [], currentBalance: balance),
            );
          },
        );
      },
    );
  }
}
