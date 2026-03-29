import 'package:dio/dio.dart';
import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/network/dio_client.dart';
import 'package:fondos/features/funds/data/datasources/fund_dao.dart';
import 'package:fondos/features/transactions/data/datasources/transaction_dao.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  DioClient get dioClient => DioClient();

  @lazySingleton
  Dio get dio => dioClient.dio;

  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();
  @lazySingleton
  FundDao getFundDao(AppDatabase db) => FundDao(db);

  @lazySingleton
  TransactionDao getTransactionDao(AppDatabase db) => TransactionDao(db);

  @lazySingleton
  UserDao getUserDao(AppDatabase db) => UserDao(db);
}
