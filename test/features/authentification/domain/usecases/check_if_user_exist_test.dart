import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:test/test.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late CheckIfUserExist checkIfUserExist;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    checkIfUserExist = CheckIfUserExist(mockAuthenticationRepository);
  });

  const uid = '123';
  const role = UserRole.defaultRole;
  const params = UserURParams(uid: uid, role: role);

  group('CheckIfUserExist', () {
    test(
        'should call and return success result when AuthenticationRepository.createUser succeeds',
        () async {
      when(() => mockAuthenticationRepository.checkIfUserExist(uid, role))
          .thenAnswer((_) async => const Right(true));

      final result = await checkIfUserExist(params);

      expect(result, const Right(true));
      verify(() => mockAuthenticationRepository.checkIfUserExist(uid, role))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should call and return failure result when AuthenticationRepository.createUser fails',
        () async {
      when(() => mockAuthenticationRepository.checkIfUserExist(uid, role))
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error creating user')));

      // Act
      final result = await checkIfUserExist(params);

      // Assert
      expect(result, const Left(DBException(message: 'Error creating user')));
      verify(() => mockAuthenticationRepository.checkIfUserExist(uid, role))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
