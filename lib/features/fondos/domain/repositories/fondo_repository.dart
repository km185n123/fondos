import 'package:fondos/features/fondos/domain/entities/fondo.dart';

abstract class FondoRepository {
  Future<List<Fondo>> obtenerFondos();
}
