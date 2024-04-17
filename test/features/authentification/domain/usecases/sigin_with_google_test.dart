import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_google.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late SiginWithGoogle siginWithGoogle;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    siginWithGoogle = SiginWithGoogle(mockAuthenticationRepository);
  });

  const user = UserModel.empty();

  group('SiginWithGoogle', () {
    test(
        'should return success result when AuthenticationRepository.siginWithGoogle succeeds',
        () async {
      when(() => mockAuthenticationRepository.siginWithGoogle())
          .thenAnswer((_) async => const Right(user));

      final result = await siginWithGoogle();

      expect(result, const Right(user));
      verify(() => mockAuthenticationRepository.siginWithGoogle())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.siginWithGoogle fails',
        () async {
      when(() => mockAuthenticationRepository.siginWithGoogle())
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error saving user')));

      // Act
      final result = await siginWithGoogle();

      // Assert
      expect(result, const Left(DBException(message: 'Error saving user')));
      verify(() => mockAuthenticationRepository.siginWithGoogle())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
