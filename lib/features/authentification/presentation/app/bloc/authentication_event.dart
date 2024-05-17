part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GetConductorEvent extends AuthenticationEvent {
  const GetConductorEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class GetSecurityEvent extends AuthenticationEvent {
  const GetSecurityEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class CreateConductorEvent extends AuthenticationEvent {
  const CreateConductorEvent({
    required this.conductor
  });

  final ConductorEntity conductor;

  @override
  List<Object> get props => [conductor];
}

class CreateSecurityEvent extends AuthenticationEvent {
  const CreateSecurityEvent({
    required this.security
  });

  final SecurityEntity security;

  @override
  List<Object> get props => [security];
}

class GetUserLoggingStateEvent extends AuthenticationEvent {}

class SetUserLoggingStateEvent extends AuthenticationEvent {}

class GetCurrentUserFromCacheEvent extends AuthenticationEvent {}

class SaveCurrenUserToCacheEvent extends AuthenticationEvent {
  const SaveCurrenUserToCacheEvent({
    required this.user
  });

  final String user;

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