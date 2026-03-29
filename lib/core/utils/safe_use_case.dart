import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/failures.dart';

class SafeUseCase {
  static Future<Either<Failure, T>> execute<T>(
    Future<Either<Failure, T>> Function() block,
  ) async {
    try {
      return await block();
    } on BusinessException catch (e) {
      return Left(BusinessFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: ${e.toString()}'));
    }
  }
}
