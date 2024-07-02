import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/create_user.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late CreateUser createUser;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    createUser = CreateUser(mockAuthenticationRepository);
  });

  const user = UserModel.empty();
  final params = UserCreationParams(user: user, role: user.role);

  group('Create user', () {

    test(
        'should call and return success result when AuthenticationRepository.createUser succeeds',
        () async {
      when(() => mockAuthenticationRepository.createUser(user, user.role))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await createUser(params);

      // Assert
      expect(result, const Right(null));
      verify(() => mockAuthenticationRepository.createUser(user, user.role)).called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });

    test(
        'should call and return failure result when AuthenticationRepository.createUser fails',
        () async {
      when(() => mockAuthenticationRepository.createUser(user, user.role))
          .thenAnswer((_) async => const
              Left(DBException(message: 'Error creating user')));

      // Act
      final result = await createUser(params);

      // Assert
      expect(result, const Left(DBException(message: 'Error creating user')));
      verify(() => mockAuthenticationRepository.createUser(user, user.role)).called(1);
      verifyNoMoreInteractions(mockAuthenticationRepository);
    });
  });
}
