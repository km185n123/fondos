import 'package:fondos/core/database/app_database.dart';
import 'package:fondos/core/database/database_connection_factory.dart';
import 'package:fondos/core/database/db_seeder_config.dart';
import 'package:fondos/core/security/encryption_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DatabaseBuilder {
  final EncryptionService encryptionService;
  final DatabaseConnectionFactory factory;
  final DbSeederConfig config;

  DatabaseBuilder(this.encryptionService, this.factory, this.config);

  Future<AppDatabase> build() async {
    final key = await encryptionService.getOrCreateKey();
    final db = await factory.create(key);
    return AppDatabase(db, config);
  }
}
