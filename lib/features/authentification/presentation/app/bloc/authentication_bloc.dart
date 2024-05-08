import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/security_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/create_conductor.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/create_security.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_conductor.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user_from_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_security.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_user_logging_state.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/save_current_user_to_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/set_user_logging_state.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_email_and_password.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_facebook.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_google.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sign_out.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required CreateConductor createConductor,
    required CreateSecurity createSecurity,
    required GetConductor getConductor,
    required GetSecurity getSecurity,
    required SetUserLoggingState setUserLoggingState,
    required GetUserLoggingState getUserLoggingState,
    required CheckIfUserExist checkIfUserExists,
    required SiginWithEmailAndPassword signinWithEmailAndPassword,
    required SigninWithFacebook signinWithFacebook,
    required SiginWithGoogle signinWithGoogle,
    required SignOut signOut,
    required SaveCurrenUserToCache saveCurrentUserToCache,
    required GetCurrentUserFromCache getCurrentUserFromCache
  }) : 
  
  _createConductor = createConductor,
  _createSecurity = createSecurity,
  _getConductor = getConductor,
  _getSecurity = getSecurity,
  _getUserLoggingState = getUserLoggingState,
  _setUserLoggingState = setUserLoggingState,
  _checkIfUserExists = checkIfUserExists,
  _signinWithEmailAndPassword = signinWithEmailAndPassword,
  _signinWithFacebook = signinWithFacebook,
  _signinWithGoogle = signinWithGoogle,
  _signOut = signOut,
  _saveCurrenUserToCache = saveCurrentUserToCache,
  _getCurrentUserFromCache = getCurrentUserFromCache,
  super(AuthenticationInitial()) {
    on<CreateConductorEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _createConductor(event.conductor);

      result.fold((l) => null, (r) => emit(UserCreatedState()));
    });
    on<CreateSecurityEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _createSecurity(event.security);

      result.fold((l) => null, (r) => emit(UserCreatedState()));
    });
    on<GetConductorEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _getConductor(event.id);

      result.fold((l) => null, (conductor) => emit(ConductorLoaded(conductor: conductor)));
    });
    on<GetSecurityEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _getSecurity(event.id);

      result.fold((l) => null, (security) => emit(SecurityLoaded(security: security)));
    });
    on<SaveCurrenUserToCacheEvent>((event, emit) async {
      final result = await _saveCurrenUserToCache(event.user);

      result.fold((l) => null, (r) => emit(UserSavedToCache()));
    });
    on<GetCurrentUserFromCacheEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _getCurrentUserFromCache();

      result.fold((l) => null, (conductor) => emit(ConductorLoaded(conductor: conductor)));
    });
    on<CheckIfUserExistsEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _checkIfUserExists(UserURParams(
        uid: event.uid, 
        role: event.role
      ));

      result.fold(
        (l) => null, 
        (exists) => emit(UserExistenceCheckedState(exists: exists))
      );
    });
    on<SiginWithEmailAndPasswordEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signinWithEmailAndPassword(AuthParams(
        email: event.email, 
        password: event.password
      ));

      result.fold(
        (l) => null, 
        (conductor) => emit(ConductorSignedInState(conductor: conductor))
      );
    });
    on<SiginWithFacebookEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signinWithFacebook();

      result.fold(
        (l) => null, 
        (conductor) => emit(ConductorSignedInState(conductor: conductor))
      );
    });
    on<SiginWithGoogleEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signinWithGoogle();

      result.fold(
        (l) => null, 
        (conductor) => emit(ConductorSignedInState(conductor: conductor))
      );
    });
    on<SignOutEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signOut();

      result.fold(
        (l) => null, 
        (_) => emit(UserSignedOutState())
      );
    });
    on<GetUserLoggingStateEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _getUserLoggingState();

      result.fold((l) => null, (isLoggedIn) => emit(UserLoggingStateLoaded(isLoggedIn: isLoggedIn)));
    });
    on<SetUserLoggingStateEvent>((event, emit) async {
      final result = await _setUserLoggingState();

      result.fold((l) => null, (_) => emit(UserLoggingStateModified()));
    });
  }

  final CreateConductor _createConductor;
  final CreateSecurity _createSecurity;
  final GetConductor _getConductor;
  final GetSecurity _getSecurity;
  final SetUserLoggingState _setUserLoggingState;
  final GetUserLoggingState _getUserLoggingState;
  final CheckIfUserExist _checkIfUserExists;
  final SiginWithEmailAndPassword _signinWithEmailAndPassword;
  final SigninWithFacebook _signinWithFacebook;
  final SiginWithGoogle _signinWithGoogle;
  final SignOut _signOut;
  final SaveCurrenUserToCache _saveCurrenUserToCache;
  final GetCurrentUserFromCache _getCurrentUserFromCache;
}
