import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/enum/notification_method.dart';
import 'package:fondos/core/enum/subscription_status.dart';
import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/transactions/domain/usecases/subscribe_fund_usecase.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/subscription_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final SubscribeFundUseCase subscribeFundUseCase;

  SubscriptionBloc({required this.subscribeFundUseCase})
    : super(const SubscriptionState()) {
    on<SubscriptionEvent>((event, emit) async {
      await event.when(
        selectFund: (fund) async => _onSelectFund(fund, emit),
        changeAmount: (amount) async => _onChangeAmount(amount, emit),
        changeNotificationMethod: (method) async =>
            _onChangeNotificationMethod(method, emit),
        confirm: () async => await _onConfirm(emit),
      );
    });
  }

  void _onSelectFund(Fund fund, Emitter<SubscriptionState> emit) {
    emit(
      state.copyWith(
        selectedFund: fund,
        status: SubscriptionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void _onChangeAmount(double amount, Emitter<SubscriptionState> emit) {
    final String? amountError = amount > state.availableBalance
        ? ErrorMessages.insufficientBalance
        : null;

    emit(
      state.copyWith(
        amount: amount,
        amountError: amountError,
        status: SubscriptionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void _onChangeNotificationMethod(
    NotificationMethod method,
    Emitter<SubscriptionState> emit,
  ) {
    emit(
      state.copyWith(
        notificationMethod: method,
        status: SubscriptionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> _onConfirm(Emitter<SubscriptionState> emit) async {
    emit(state.copyWith(status: SubscriptionStatus.loading));
    if (state.selectedFund == null) {
      emit(
        state.copyWith(
          status: SubscriptionStatus.error,
          errorMessage: ErrorMessages.selectFundError,
        ),
      );
      return;
    }

    if (state.amount < state.selectedFund!.minimumAmount) {
      emit(
        state.copyWith(
          status: SubscriptionStatus.error,
          errorMessage: ErrorMessages.errorMinAmount,
        ),
      );
      return;
    }

    if (state.notificationMethod == null) {
      emit(
        state.copyWith(
          status: SubscriptionStatus.error,
          errorMessage: ErrorMessages.errorNotificationMethod,
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: SubscriptionStatus.loading, errorMessage: null),
    );

    final result = await subscribeFundUseCase.call(
      fund: state.selectedFund!,
      amount: state.amount,
      notificationMethod: state.notificationMethod!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: SubscriptionStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: SubscriptionStatus.success));
      },
    );
  }
}
