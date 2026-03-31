import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';

extension FundDbMapper on FundDb {
  Fund toDomain() {
    return Fund(
      id: id,
      name: name,
      minimumAmount: minimumAmount,
      category: category,
    );
  }
}
