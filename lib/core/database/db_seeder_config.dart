import 'package:injectable/injectable.dart';

@lazySingleton
class DbSeederConfig {
  final String initialUserId = '1';
  final double initialUserBalance = 500000.0;
}
