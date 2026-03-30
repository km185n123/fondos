// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/funds/data/datasources/fund_api_service.dart' as _i890;
import '../../features/funds/data/datasources/fund_dao.dart' as _i481;
import '../../features/funds/data/repositories/fund_repository_impl.dart'
    as _i985;
import '../../features/funds/domain/repositories/fund_repository.dart' as _i650;
import '../../features/funds/domain/usecases/get_funds_usecase.dart' as _i98;
import '../../features/funds/domain/usecases/watch_current_balance_usecase.dart'
    as _i112;
import '../../features/funds/presentation/bloc/fund_bloc.dart' as _i979;
import '../../features/history/data/datasource/history_dao.dart' as _i238;
import '../../features/history/data/repositories/history_respository_impl.dart'
    as _i895;
import '../../features/history/domain/repositories/history_repository.dart'
    as _i142;
import '../../features/history/domain/usecases/get_history_usecase.dart'
    as _i840;
import '../../features/history/presentation/bloc/history_bloc.dart' as _i1070;
import '../../features/transactions/data/datasources/transaction_api_service.dart'
    as _i21;
import '../../features/transactions/data/datasources/transaction_dao.dart'
    as _i514;
import '../../features/transactions/data/repositories/transaction_repository_impl.dart'
    as _i443;
import '../../features/transactions/domain/repositories/transaction_repository.dart'
    as _i421;
import '../../features/transactions/domain/usecases/cancel_investment_usecase.dart'
    as _i522;
import '../../features/transactions/domain/usecases/subscribe_fund_usecase.dart'
    as _i219;
import '../../features/transactions/domain/usecases/watch_investments_usecase.dart'
    as _i918;
import '../../features/transactions/presentation/bloc/investments_bloc.dart'
    as _i1012;
import '../../features/transactions/presentation/bloc/subscription_bloc.dart'
    as _i433;
import '../../features/user/data/datasources/user_dao.dart' as _i126;
import '../../features/user/data/repositories/user_repository_impl.dart'
    as _i664;
import '../../features/user/domain/repositories/user_repository.dart' as _i237;
import '../database/app_database.dart' as _i982;
import '../database/database_builder.dart' as _i1026;
import '../database/database_connection_factory.dart' as _i816;
import '../database/db_seeder_config.dart' as _i612;
import '../network/dio_client.dart' as _i667;
import '../security/encryption_service.dart' as _i320;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i612.DbSeederConfig>(() => _i612.DbSeederConfig());
    gh.lazySingleton<_i667.DioClient>(() => appModule.dioClient);
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i816.DatabaseConnectionFactory>(
      () => appModule.dbFactory,
    );
    gh.lazySingleton<_i320.EncryptionService>(
      () => appModule.encryptionService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i1026.DatabaseBuilder>(
      () => _i1026.DatabaseBuilder(
        gh<_i320.EncryptionService>(),
        gh<_i816.DatabaseConnectionFactory>(),
        gh<_i612.DbSeederConfig>(),
      ),
    );
    gh.lazySingleton<_i890.FundApiService>(
      () => _i890.FundApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i21.TransactionApiService>(
      () => _i21.TransactionApiService(gh<_i361.Dio>()),
    );
    await gh.lazySingletonAsync<_i982.AppDatabase>(
      () => appModule.appDatabase(
        gh<_i320.EncryptionService>(),
        gh<_i816.DatabaseConnectionFactory>(),
        gh<_i612.DbSeederConfig>(),
        gh<_i1026.DatabaseBuilder>(),
      ),
      preResolve: true,
    );
    gh.factory<_i238.HistoryDao>(
      () => _i238.HistoryDao(gh<_i982.AppDatabase>()),
    );
    gh.lazySingleton<_i481.FundDao>(
      () => appModule.fundDao(gh<_i982.AppDatabase>()),
    );
    gh.lazySingleton<_i514.TransactionDao>(
      () => appModule.transactionDao(gh<_i982.AppDatabase>()),
    );
    gh.lazySingleton<_i126.UserDao>(
      () => appModule.userDao(gh<_i982.AppDatabase>()),
    );
    gh.factory<_i237.UserRepository>(
      () => _i664.UserRepositoryImpl(gh<_i126.UserDao>()),
    );
    gh.lazySingleton<_i421.TransactionRepository>(
      () => _i443.TransactionRepositoryImpl(
        transactionDao: gh<_i514.TransactionDao>(),
        userDao: gh<_i126.UserDao>(),
        apiService: gh<_i21.TransactionApiService>(),
      ),
    );
    gh.lazySingleton<_i918.WatchInvestmentsUseCase>(
      () => _i918.WatchInvestmentsUseCase(gh<_i421.TransactionRepository>()),
    );
    gh.factory<_i142.HistoryRepository>(
      () => _i895.HistoryRepositoryImpl(gh<_i238.HistoryDao>()),
    );
    gh.factory<_i840.GetHistoryUseCase>(
      () => _i840.GetHistoryUseCase(gh<_i142.HistoryRepository>()),
    );
    gh.factory<_i1070.HistoryBloc>(
      () =>
          _i1070.HistoryBloc(getHistoryUseCase: gh<_i840.GetHistoryUseCase>()),
    );
    gh.lazySingleton<_i522.CancelInvestmentUseCase>(
      () => _i522.CancelInvestmentUseCase(
        gh<_i421.TransactionRepository>(),
        gh<_i142.HistoryRepository>(),
      ),
    );
    gh.lazySingleton<_i650.FundRepository>(
      () => _i985.FundRepositoryImpl(
        apiService: gh<_i890.FundApiService>(),
        fundDao: gh<_i481.FundDao>(),
        userRepository: gh<_i237.UserRepository>(),
      ),
    );
    gh.factory<_i112.WatchCurrentBalanceUseCase>(
      () => _i112.WatchCurrentBalanceUseCase(
        repository: gh<_i650.FundRepository>(),
      ),
    );
    gh.lazySingleton<_i219.SubscribeFundUseCase>(
      () => _i219.SubscribeFundUseCase(
        gh<_i237.UserRepository>(),
        gh<_i421.TransactionRepository>(),
        gh<_i142.HistoryRepository>(),
      ),
    );
    gh.factory<_i1012.InvestmentsBloc>(
      () => _i1012.InvestmentsBloc(
        watchInvestmentsUseCase: gh<_i918.WatchInvestmentsUseCase>(),
        cancelInvestmentUseCase: gh<_i522.CancelInvestmentUseCase>(),
      ),
    );
    gh.factory<_i433.SubscriptionBloc>(
      () => _i433.SubscriptionBloc(
        subscribeFundUseCase: gh<_i219.SubscribeFundUseCase>(),
      ),
    );
    gh.lazySingleton<_i98.GetFundsUseCase>(
      () => _i98.GetFundsUseCase(gh<_i650.FundRepository>()),
    );
    gh.factory<_i979.FundBloc>(
      () => _i979.FundBloc(
        getFundsUseCase: gh<_i98.GetFundsUseCase>(),
        watchCurrentBalance: gh<_i112.WatchCurrentBalanceUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
