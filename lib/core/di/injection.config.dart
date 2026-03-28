// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/funds/data/datasources/fund_dao.dart' as _i481;
import '../database/app_database.dart' as _i982;
import '../network/dio_client.dart' as _i667;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i667.DioClient>(() => appModule.dioClient);
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i982.AppDatabase>(() => appModule.appDatabase);
    gh.lazySingleton<_i481.FundDao>(
      () => appModule.getFundDao(gh<_i982.AppDatabase>()),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
