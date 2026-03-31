import 'package:dio/dio.dart';
import 'package:fondos/core/network/api_paths.dart';
import 'package:fondos/core/utils/safe_api_call.dart';
import 'package:fondos/features/funds/data/models/fund_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FundApiService {
  final Dio _dio;

  FundApiService(this._dio);

  Future<List<FundDTO>> getFunds() {
    return SafeApiCall.execute(() async {
      final response = await _dio.get(ApiPaths.funds);

      final data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => FundDTO.fromJson(json as Map<String, dynamic>))
          .toList();
    });
  }
}
