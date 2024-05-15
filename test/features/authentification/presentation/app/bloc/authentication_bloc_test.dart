import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user_from_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_user_logging_state.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/save_current_user_to_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/set_user_logging_state.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_email_and_password.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_facebook.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_google.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sign_out.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';

class MockCreateUser extends Mock implements CreateUser {}

class MockGetCurrentUser extends Mock implements GetCurrentUser {}
class MockGetUserLogginState extends Mock implements GetUserLoggingState {}
class MockSetUserLogginState extends Mock implements SetUserLoggingState {}

class MockCheckIfUserExists extends Mock implements CheckIfUserExist {}

class MockSiginWithEmailAndPassword extends Mock implements SiginWithEmailAndPassword {}

class MockSiginWithFacebook extends Mock implements SigninWithFacebook {}

class MockSiginWithGoogle extends Mock implements SiginWithGoogle {}

class MockSignOut extends Mock implements SignOut {}

class MockSaveCurrenUserToCache extends Mock implements SaveCurrenUserToCache {}

class MockGetCurrentUserFromCache extends Mock implements GetCurrentUserFromCache {}

void main() {
  late AuthenticationBloc authenticationBloc;
  late MockCreateUser mockCreateUser;
  late MockGetCurrentUser mockGetCurrentUser;
  late MockGetUserLogginState mockGetUserLogginState;
  late MockSetUserLogginState mockSetUserLogginState;
  late MockCheckIfUserExists mockCheckIfUserExists;
  late MockSiginWithEmailAndPassword mockSiginWithEmailAndPassword;
  late MockSiginWithFacebook mockSiginWithFacebook;
  late MockSiginWithGoogle mockSiginWithGoogle;
  late MockSignOut mockSignOut;
  late MockSaveCurrenUserToCache mockSaveCurrenUserToCache;
  late MockGetCurrentUserFromCache mockGetCurrentUserFromCache;

  setUp(() {
    mockCreateUser = MockCreateUser();
    mockGetCurrentUser = MockGetCurrentUser();
    mockGetUserLogginState = MockGetUserLogginState();
    mockSetUserLogginState = MockSetUserLogginState();
    mockCheckIfUserExists = MockCheckIfUserExists();
    mockSiginWithEmailAndPassword = MockSiginWithEmailAndPassword();
    mockSiginWithFacebook = MockSiginWithFacebook();
    mockSiginWithGoogle = MockSiginWithGoogle();
    mockSignOut = MockSignOut();
    mockSaveCurrenUserToCache = MockSaveCurrenUserToCache();
    mockGetCurrentUserFromCache = MockGetCurrentUserFromCache();

    authenticationBloc = AuthenticationBloc(
      createUser: mockCreateUser,
      getCurrentUser: mockGetCurrentUser,
      getUserLoggingState: mockGetUserLogginState,
      setUserLoggingState: mockSetUserLogginState,
      checkIfUserExists: mockCheckIfUserExists,
      signinWithEmailAndPassword: mockSiginWithEmailAndPassword,
      signinWithFacebook: mockSiginWithFacebook,
      signinWithGoogle: mockSiginWithGoogle,
      signOut: mockSignOut,
      saveCurrentUserToCache: mockSaveCurrenUserToCache,
      getCurrentUserFromCache: mockGetCurrentUserFromCache,
    );

  });

  const user = UserModel.empty();
  final params = CreateUserParams(
    id: 'id',
    name: 'name',
    phone: 'phone',
    role: UserRole.conducteur,
    workDuration: 0,
    startAt: DateTime.now(),
    endAt: DateTime.now()
  );
  final urParams = UserURParams(uid: 'uid', role: user.role);
  const authParams = AuthParams(email: 'email', password: 'password');

  group('authentication_bloc_test', () { 

    // CreateUserEvent Test
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthLoadingState] then [UserCreatedState] when CreateUserEvent is added',
      build: () {
        when(() => mockCreateUser(params)).thenAnswer((_) async => const Right(null));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const CreateUserEvent(
        id: 'id', 
        name: 'name', 
        phone: 'phone', 
        role: UserRole.conducteur
      )),
      expect: () => [isA<AuthLoadingState>(), isA<UserCreatedState>()],
      verify: (_) => verify(() => mockCreateUser(params)).called(1) ,
    );

    // GetCurrentUserEvent Test
    blocTest('emits [AuthLoadingState] then [UserLoadedState] when GetCurrentUserEvent is added', 
      build: () {
        when(() => mockGetCurrentUser(urParams)).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(GetCurrentUserEvent(uid: 'uid', role: user.role)),
      expect: () => [isA<AuthLoadingState>(), isA<UserLoadedState>()],
      verify: (_) => verify(() => mockGetCurrentUser(urParams)).called(1),
    );

    // CheckIfUserExistEvent Test
    blocTest('emits [AuthLoadingState] then [UserExistenceCheckedState] when CheckIfUserExistEvent is added', 
      build: () {
        when(() => mockCheckIfUserExists(urParams)).thenAnswer((_) async => const Right(true));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(CheckIfUserExistsEvent(uid: 'uid', role: user.role)),
      expect: () => [isA<AuthLoadingState>(), isA<UserExistenceCheckedState>()],
      verify: (_) => verify(() => mockCheckIfUserExists(urParams)).called(1),
    );

    // SaveCurrenUserToCacheEvent Test
    blocTest('emits [UserLoadedState] when SaveCurrenUserToCacheEvent is added', 
      build: () {
        when(() => mockSaveCurrenUserToCache(user)).thenAnswer((_) async => const Right(null));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const SaveCurrenUserToCacheEvent(user: user)),
      expect: () => [isA<UserCreatedState>()],
      verify: (_) => verify(() => mockSaveCurrenUserToCache(user)).called(1),
    );

    // GetCurrentUserFromCacheEvent Test
    blocTest('emits [AuthLoadingState] then [UserLoadedState] when GetCurrentUserFromCacheEvent is added', 
      build: () {
        when(() => mockGetCurrentUserFromCache()).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(GetCurrentUserFromCacheEvent()),
      expect: () => [isA<AuthLoadingState>(), isA<UserLoadedState>()],
      verify: (_) => verify(() => mockGetCurrentUserFromCache()).called(1),
    );

    // SiginWithEmailAndPasswordEvent Test
    blocTest('emits [AuthLoadingState] then [UserSignedInState] when SiginWithEmailAndPasswordEvent is added', 
      build: () {
        when(() => mockSiginWithEmailAndPassword(authParams)).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const SiginWithEmailAndPasswordEvent(email: 'email', password: 'password')),
      expect: () => [isA<AuthLoadingState>(), isA<UserSignedInState>()],
      verify: (_) => verify(() => mockSiginWithEmailAndPassword(authParams)).called(1),
    );

    // SiginWithFacebookEvent Test
    blocTest('emits [AuthLoadingState] then [UserSignedInState] when SiginWithFacebookEvent is added', 
      build: () {
        when(() => mockSiginWithFacebook()).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SiginWithFacebookEvent()),
      expect: () => [isA<AuthLoadingState>(), isA<UserSignedInState>()],
      verify: (_) => verify(() => mockSiginWithFacebook()).called(1),
    );

    // SiginWithGoogleEvent Test
    blocTest('emits [AuthLoadingState] then [UserSignedInState] when SiginWithGoogleEvent is added', 
      build: () {
        when(() => mockSiginWithGoogle()).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SiginWithGoogleEvent()),
      expect: () => [isA<AuthLoadingState>(), isA<UserSignedInState>()],
      verify: (_) => verify(() => mockSiginWithGoogle()).called(1),
    );

    // SignOutEvent Test
    blocTest('emits [AuthLoadingState] then [UserSignedOutState] when SignOutEvent is added', 
      build: () {
        when(() => mockSignOut()).thenAnswer((_) async => const Right(null));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SignOutEvent()),
      expect: () => [isA<AuthLoadingState>(), isA<UserSignedOutState>()],
      verify: (_) => verify(() => mockSignOut()).called(1),
    );

  });

  

}