import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sign_out.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late SignOut signOut;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    signOut = SignOut(mockAuthenticationRepository);
  });

  group('SignOut', () {
    test(
        'should return success result when AuthenticationRepository.signOut succeeds',
        () async {
      when(() => mockAuthenticationRepository.signOut())
          .thenAnswer((_) async => const Right(null));

      final result = await signOut();

      expect(result, const Right(null));
      verify(() => mockAuthenticationRepository.signOut())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.signOut fails',
        () async {
      when(() => mockAuthenticationRepository.signOut())
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error saving user')));

      // Act
      final result = await signOut();

      // Assert
      expect(result, const Left(DBException(message: 'Error saving user')));
      verify(() => mockAuthenticationRepository.signOut())
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
