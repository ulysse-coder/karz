import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart'; 

// Mock class for AuthenticationRepository
class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {
  late CheckIfUserExist checkIfUserExist;
  late AuthenticationRepository repository;
  const tBool = true;
  const userURParams = UserURParams(
    uid: 'user_id', 
    role: UserRole.conducteur
  );

  setUpAll(() {
    repository = MockAuthenticationRepository();
    checkIfUserExist = CheckIfUserExist(repository);
  });

  test('should call [checkIfUserExist] method of AuthenticationRepository and complete successfully', () async {
    // Arrange
    when(() => repository.checkIfUserExist(
      'uid',
      UserRole.conducteur
    )).thenAnswer((_) async => const Right(tBool));

    // Act
    final result = await checkIfUserExist(userURParams);

    // Assert
    expect(result, equals(const Right<dynamic, bool>(tBool)));
    verify(() => repository.checkIfUserExist(
      'user_id', 
      UserRole.conducteur
    )).called(1);
    verifyNoMoreInteractions(repository);
  });
}
