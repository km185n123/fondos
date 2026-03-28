import 'package:funds/features/funds/domain/entities/fund.dart';
import 'package:funds/features/funds/domain/repositories/fund_repository.dart';

class GetFundsUseCase {
  final FundRepository repository;

  GetFundsUseCase(this.repository);

  Future<List<Fund>> call() async {
    return await repository.getFunds();
  }
}
