import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_email_and_password.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late SiginWithEmailAndPassword siginWithEmailAndPassword;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    siginWithEmailAndPassword = SiginWithEmailAndPassword(mockAuthenticationRepository);
  });

  const email = "email@example.com";
  const password = '1234';
  const params = AuthParams(email: email, password: password);
  const user = UserModel.empty();

  group('SiginWithEmailAndPassword', () {
    test(
        'should return success result when AuthenticationRepository.siginWithEmailAndPassword succeeds',
        () async {
      when(() => mockAuthenticationRepository.siginWithEmailAndPassword(email, password))
          .thenAnswer((_) async => const Right(user));

      final result = await siginWithEmailAndPassword(params);

      expect(result, const Right(user));
      verify(() => mockAuthenticationRepository.siginWithEmailAndPassword(email, password))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.siginWithEmailAndPassword fails',
        () async {
      when(() => mockAuthenticationRepository.siginWithEmailAndPassword(email, password))
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error saving user')));

      // Act
      final result = await siginWithEmailAndPassword(params);

      // Assert
      expect(result, const Left(DBException(message: 'Error saving user')));
      verify(() => mockAuthenticationRepository.siginWithEmailAndPassword(email, password))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
