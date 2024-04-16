part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentUserEvent extends AuthenticationEvent {
  const GetCurrentUserEvent({
    required this.uid,
    required this.role
  });

  final String uid;
  final UserRole role;

  @override
  List<Object> get props => [uid, role];
}

class GetUserLoggingStateEvent extends AuthenticationEvent {}

class SetUserLoggingStateEvent extends AuthenticationEvent {}

class GetCurrentUserFromCacheEvent extends AuthenticationEvent {}

class CreateUserEvent extends AuthenticationEvent {
  const CreateUserEvent({
    required this.user,
    required this.role
  });

  final UserModel user;
  final UserRole role;
  
  @override
  List<Object> get props => [user, role];
}

class SaveCurrenUserToCacheEvent extends AuthenticationEvent {
  const SaveCurrenUserToCacheEvent({
    required this.user
  });

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class CheckIfUserExistsEvent extends AuthenticationEvent {
  const CheckIfUserExistsEvent({
    required this.uid,
    required this.role
  });

  final String uid;
  final UserRole role;

  @override
  List<Object> get props => [uid, role];
}

class SiginWithEmailAndPasswordEvent extends AuthenticationEvent {
  const SiginWithEmailAndPasswordEvent({
    required this.email,
    required this.password
  });

  final String email;
  final String password;
  
  @override
  List<Object> get props => [email, password];
}

class SiginWithFacebookEvent extends AuthenticationEvent {}

class SiginWithGoogleEvent extends AuthenticationEvent {} 

class SignOutEvent extends AuthenticationEvent {}