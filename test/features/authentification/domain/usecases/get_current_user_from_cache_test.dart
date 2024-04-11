import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user_from_cache.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late GetCurrentUserFromCache getCurrentUserFromCache;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    getCurrentUserFromCache = GetCurrentUserFromCache(mockAuthenticationRepository);
  });

  const user = UserModel.empty();

  group('GetCurrentUserFromCache', () {
    test(
        'should call and return success result when AuthenticationRepository.getCurrentUserFromCache succeeds',
        () async {
      when(() => mockAuthenticationRepository.getCurrentUserFromCache())
          .thenAnswer((_) async => const Right(user));

      final result = await getCurrentUserFromCache();

      expect(result, const Right(user));
      verify(() => mockAuthenticationRepository.getCurrentUserFromCache())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should call and return failure result when AuthenticationRepository.getCurrentUserFromCache fails',
        () async {
      when(() => mockAuthenticationRepository.getCurrentUserFromCache())
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error creating user')));

      // Act
      final result = await getCurrentUserFromCache();

      // Assert
      expect(result, const Left(DBException(message: 'Error creating user')));
      verify(() => mockAuthenticationRepository.getCurrentUserFromCache())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
