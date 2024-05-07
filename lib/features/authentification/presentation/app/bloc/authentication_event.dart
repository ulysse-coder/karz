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
    required this.id,
    required this.name,
    required this.phone,
    required this.role, 
    this.workDuration, 
    this.startAt, 
    this.endAt,
  });

  final String id;
  final String name;
  final String phone;
  final UserRole role; 
  final int? workDuration; 
  final DateTime? startAt; 
  final DateTime? endAt;
  
  @override
  List<Object> get props => [id, name, phone, role, workDuration!, startAt!, endAt!];
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