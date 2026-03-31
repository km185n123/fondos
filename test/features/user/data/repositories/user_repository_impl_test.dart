import 'package:flutter_test/flutter_test.dart';
import 'package:fondos/core/enum/notification_method.dart';
import 'package:fondos/features/user/data/datasources/user_dao.dart';
import 'package:fondos/features/user/data/repositories/user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDao extends Mock implements UserDao {}

void main() {
  late MockUserDao mockUserDao;
  late UserRepositoryImpl userRepository;

  setUp(() {
    mockUserDao = MockUserDao();
    userRepository = UserRepositoryImpl(mockUserDao);
  });

  group('UserRepositoryImpl', () {
    test('watchBalance calls userDao.watchBalance()', () {
      // arrange
      final stream = Stream.fromIterable([1000.0]);
      when(() => mockUserDao.watchBalance()).thenAnswer((_) => stream);

      // act
      final result = userRepository.watchBalance();

      // assert
      expect(result, stream);
      verify(() => mockUserDao.watchBalance()).called(1);
    });

    test('updateBalance calls userDao.updateBalance()', () async {
      // arrange
      when(() => mockUserDao.updateBalance(any())).thenAnswer((_) async {});

      // act
      await userRepository.updateBalance(1000.0);

      // assert
      verify(() => mockUserDao.updateBalance(1000.0)).called(1);
    });

    test('saveNotificationPreference calls userDao.updateNotificationMethod()', () async {
      // arrange
      when(() => mockUserDao.updateNotificationMethod(any())).thenAnswer((_) async {});

      // act
      await userRepository.saveNotificationPreference(NotificationMethod.email);

      // assert
      verify(() => mockUserDao.updateNotificationMethod(NotificationMethod.email.name)).called(1);
    });
  });
}
