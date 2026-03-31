import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';

extension FundDtoMapper on FundDTO {
  FundDb toDb() {
    return FundDb(
      id: id,
      name: name,
      minimumAmount: minimumAmount,
      category: category,
    );
  }
}
