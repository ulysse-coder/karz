import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_facebook.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late SigninWithFacebook signinWithFacebook;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    signinWithFacebook = SigninWithFacebook(mockAuthenticationRepository);
  });

  const user = UserModel.empty();

  group('SigninWithFacebook', () {
    test(
        'should return success result when AuthenticationRepository.siginWithFacebook succeeds',
        () async {
      when(() => mockAuthenticationRepository.siginWithFacebook())
          .thenAnswer((_) async => const Right(user));

      final result = await signinWithFacebook();

      expect(result, const Right(user));
      verify(() => mockAuthenticationRepository.siginWithFacebook())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.siginWithFacebook fails',
        () async {
      when(() => mockAuthenticationRepository.siginWithFacebook())
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error saving user')));

      // Act
      final result = await signinWithFacebook();

      // Assert
      expect(result, const Left(DBException(message: 'Error saving user')));
      verify(() => mockAuthenticationRepository.siginWithFacebook())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
