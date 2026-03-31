import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/history/domain/entitie/history.dart';

extension HistoryMapper on HistoryTable {
  History toDomain() {
    return History(title: title, amount: amount, isPositive: isPositive);
  }
}
