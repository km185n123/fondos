import 'package:dio/dio.dart';
import '../models/fondo_dto.dart';

class FondoApiService {
  final Dio _dio;

  FondoApiService(this._dio);

  Future<List<FondoDTO>> obtenerFondos() async {
    try {
      final response = await _dio.get('/fondos');

      final data = response.data as List<dynamic>;
      return data
          .map((json) => FondoDTO.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Error de red al obtener los fondos: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
