import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/security/encryption_service.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late EncryptionService encryptionService;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    encryptionService = EncryptionService(mockStorage);
  });

  group('EncryptionService', () {
    const keyAlias = 'db_encryption_key';

    test('getOrCreateKey returns existing key if it exists', () async {
      // arrange
      const existingKey = 'existing_key';
      when(() => mockStorage.read(key: keyAlias)).thenAnswer((_) async => existingKey);

      // act
      final result = await encryptionService.getOrCreateKey();

      // assert
      expect(result, existingKey);
      verify(() => mockStorage.read(key: keyAlias)).called(1);
      verifyNever(() => mockStorage.write(key: any(named: 'key'), value: any(named: 'value')));
    });

    test('getOrCreateKey creates and saves new key if none exists', () async {
      // arrange
      when(() => mockStorage.read(key: keyAlias)).thenAnswer((_) async => null);
      when(() => mockStorage.write(key: any(named: 'key'), value: any(named: 'value')))
          .thenAnswer((_) async {});

      // act
      final result = await encryptionService.getOrCreateKey();

      // assert
      expect(result, isNotNull);
      expect(result.isNotEmpty, true);
      verify(() => mockStorage.read(key: keyAlias)).called(1);
      verify(() => mockStorage.write(key: keyAlias, value: result)).called(1);
    });
  });
}
