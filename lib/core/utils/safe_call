import 'package:fpdart/fpdart.dart';
import 'package:fondos/core/errors/error_messages.dart';
import 'package:fondos/core/errors/exceptions.dart';
import 'package:fondos/core/errors/failures.dart';

class SafeCall {
  static Future<Either<Failure, T>> execute<T>({
    required Future<T> Function() tryBlock,
    Future<T> Function()? fallback,
  }) async {
    try {
      final result = await tryBlock();
      return Right(result);
    } on ServerException {
      if (fallback != null) {
        try {
          final result = await fallback();
          return Right(result);
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
      return const Left(ServerFailure(ErrorMessages.serverError));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(ErrorMessages.unexpectedError));
    }
  }
}