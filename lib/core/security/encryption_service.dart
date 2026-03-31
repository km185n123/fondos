import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static const _keyAlias = 'db_encryption_key';
  final FlutterSecureStorage _storage;

  const EncryptionService(this._storage);

  Future<String> getOrCreateKey() async {
    final existing = await _storage.read(key: _keyAlias);
    if (existing != null) return existing;

    final random = Random.secure();
    final keyBytes = List<int>.generate(32, (_) => random.nextInt(256));
    final newKey = base64Encode(keyBytes);

    await _storage.write(key: _keyAlias, value: newKey);
    return newKey;
  }
}
