import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:ulysse_app/core/utilities/auth_params.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/create_user.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_email_and_password.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_facebook.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_google.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sign_out.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required CreateUser createUser,
    required GetCurrentUser getCurrentUser,
    required CheckIfUserExist checkIfUserExists,
    required SiginWithEmailAndPassword signinWithEmailAndPassword,
    required SigninWithFacebook signinWithFacebook,
    required SiginWithGoogle signinWithGoogle,
    required SignOut signOut
  }) : 
  
  _createUser = createUser,
  _getCurrentUser = getCurrentUser,
  _checkIfUserExists = checkIfUserExists,
  _signinWithEmailAndPassword = signinWithEmailAndPassword,
  _signinWithFacebook = signinWithFacebook,
  _signinWithGoogle = signinWithGoogle,
  _signOut = signOut,
  super(AuthenticationInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _createUser(UserCreationParams(
        user: event.user, 
        role: event.role
      ));

      result.fold(
        (l) => null, 
        (_) => emit(UserCreatedState())
      );
    });
    on<GetCurrentUserEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _getCurrentUser(UserURParams(
        uid: event.uid, 
        role: event.role
      ));
      
      result.fold(
        (l) => null, 
        (user) => emit(UserLoadedState(user: user))
      );
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
        (user) => emit(UserSignedInState(user: user))
      );
    });
    on<SiginWithFacebookEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signinWithFacebook();

      result.fold(
        (l) => null, 
        (user) => emit(UserSignedInState(user: user))
      );
    });
    on<SiginWithGoogleEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await _signinWithGoogle();

      result.fold(
        (l) => null, 
        (user) => emit(UserSignedInState(user: user))
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
  }

  final CreateUser _createUser;
  final GetCurrentUser _getCurrentUser;
  final CheckIfUserExist _checkIfUserExists;
  final SiginWithEmailAndPassword _signinWithEmailAndPassword;
  final SigninWithFacebook _signinWithFacebook;
  final SiginWithGoogle _signinWithGoogle;
  final SignOut _signOut;
}
