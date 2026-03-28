import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/domain/repositories/fund_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFundsUseCase {
  final FundRepository repository;

  GetFundsUseCase(this.repository);

  Future<List<Fund>> call() async {
    return await repository.getFunds();
  }
}
