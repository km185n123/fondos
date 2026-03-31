import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/database/database_builder.dart';
import 'package:fondos/core/database/database_connection_factory.dart';
import 'package:fondos/core/network/dio_client.dart';
import 'package:fondos/core/security/encryption_service.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // -------- NETWORK --------
  @lazySingleton
  DioClient get dioClient => DioClient();

  @lazySingleton
  Dio get dio => dioClient.dio;

  // -------- SECURITY --------
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  EncryptionService encryptionService(FlutterSecureStorage storage) =>
      EncryptionService(storage);

  // -------- DATABASE --------
  @lazySingleton
  DatabaseConnectionFactory get dbFactory => DatabaseConnectionFactory();

  @preResolve
  @lazySingleton
  Future<AppDatabase> appDatabase(
    EncryptionService encryptionService,
    DatabaseConnectionFactory factory,
    DatabaseBuilder builder,
  ) async => builder.build();

  // -------- DAOs --------
  @lazySingleton
  FundDao fundDao(AppDatabase db) => FundDao(db);

  @lazySingleton
  TransactionDao transactionDao(AppDatabase db) => TransactionDao(db);

  @lazySingleton
  UserDao userDao(AppDatabase db) => UserDao(db);
}
