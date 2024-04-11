import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/save_current_user_to_cache.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late SaveCurrenUserToCache saveCurrenUserToCache;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    saveCurrenUserToCache = SaveCurrenUserToCache(mockAuthenticationRepository);
  });

  const user = UserModel.empty();

  group('SaveCurrenUserToCache', () {
    test(
        'should return success result when AuthenticationRepository.saveCurrentUserToCache succeeds',
        () async {
      when(() => mockAuthenticationRepository.saveCurrentUserToCache(user))
          .thenAnswer((_) async => const Right(null));

      final result = await saveCurrenUserToCache(user);

      expect(result, const Right(null));
      verify(() => mockAuthenticationRepository.saveCurrentUserToCache(user))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.saveCurrentUserToCache fails',
        () async {
      when(() => mockAuthenticationRepository.saveCurrentUserToCache(user))
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error saving user')));

      // Act
      final result = await saveCurrenUserToCache(user);

      // Assert
      expect(result, const Left(DBException(message: 'Error saving user')));
      verify(() => mockAuthenticationRepository.saveCurrentUserToCache(user))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
