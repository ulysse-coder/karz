import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late GetCurrentUser getCurrentUser;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    getCurrentUser = GetCurrentUser(mockAuthenticationRepository);
  });

  const uid = '123';
  const role = UserRole.conducteur;
  const user = UserModel.empty();
  const params = UserURParams(uid: uid, role: role);

  group('GetCurrentUser', () {
    test(
        'should return success result when AuthenticationRepository.getCurrentUser succeeds',
        () async {
      when(() => mockAuthenticationRepository.getCurrentUser(uid, role))
          .thenAnswer((_) async => const Right(user));

      final result = await getCurrentUser(params);

      expect(result, const Right(user));
      verify(() => mockAuthenticationRepository.getCurrentUser(uid, role))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should return failure result when AuthenticationRepository.getCurrentUser fails',
        () async {
      when(() => mockAuthenticationRepository.getCurrentUser(uid, role))
          .thenAnswer((_) async =>
              const Left(DBException(message: 'Error getting user')));

      // Act
      final result = await getCurrentUser(params);

      // Assert
      expect(result, const Left(DBException(message: 'Error getting user')));
      verify(() => mockAuthenticationRepository.getCurrentUser(uid, role))
          .called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
