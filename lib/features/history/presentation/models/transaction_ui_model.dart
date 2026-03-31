import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_ui_model.freezed.dart';

@freezed
abstract class TransactionUiModel with _$TransactionUiModel {
  const factory TransactionUiModel({
    required String title,
    required String amount,
    required bool isPositive,
  }) = _TransactionUiModel;
}
