import 'package:fondos/features/fondos/domain/entities/fondo.dart';
import 'package:fondos/features/fondos/domain/repositories/fondo_repository.dart';

class ObtenerFondosUseCase {
  final FondoRepository repository;

  ObtenerFondosUseCase(this.repository);

  Future<List<Fondo>> call() async {
    return await repository.obtenerFondos();
  }
}
