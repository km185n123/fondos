import 'package:dio/dio.dart';
import '../models/fund_dto.dart';

class FundApiService {
  final Dio _dio;

  FundApiService(this._dio);

  Future<List<FundDTO>> getFunds() async {
    try {
      final response = await _dio.get('/funds');

      final data = response.data as List<dynamic>;
      return data
          .map((json) => FundDTO.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Error de red al obtener los funds: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
