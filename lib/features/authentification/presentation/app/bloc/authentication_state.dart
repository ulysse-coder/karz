part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthLoadingState extends AuthenticationState {}

final class UserLoadedState extends AuthenticationState {
  const UserLoadedState({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class UserLoggingStateLoaded extends AuthenticationState {
  const UserLoggingStateLoaded({
    required this.isLoggedIn
  });

  final bool isLoggedIn;

  @override
  List<Object> get props => [isLoggedIn];
}

final class UserLoggingStateModified extends AuthenticationState {}

final class UserCreatedState extends AuthenticationState {}

final class UserSignedInState extends AuthenticationState {
  const UserSignedInState({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class UserSignedOutState extends AuthenticationState {}

final class UserExistenceCheckedState extends AuthenticationState {
  const UserExistenceCheckedState({required this.exists});

  final bool exists;

  @override
  List<Object> get props => [exists];
}