import '../entities/fondo.dart';

abstract class FondoRepository {
  Future<List<Fondo>> obtenerFondos();
}
