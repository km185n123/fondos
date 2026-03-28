import 'package:fondos/core/errors/failures.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fpdart/fpdart.dart';

abstract class FundRepository {
  Future<Either<Failure, List<Fund>>> getFunds();
}
