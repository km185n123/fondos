import 'package:fpdart/fpdart.dart';
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
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      if (fallback != null) {
        try {
          final result = await fallback();
          return Right(result);
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
