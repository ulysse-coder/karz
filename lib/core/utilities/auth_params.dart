
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';

class AuthParams extends Equatable {
  const AuthParams({
    required this.email,
    required this.password
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class UserCreationParams extends Equatable {
  const UserCreationParams({
    required this.user,
    required this.role
  });

  final UserEntity user;
  final UserRole role;

  @override
  List<Object?> get props => [user, role];
}

class UserURParams extends Equatable {
  const UserURParams({
    required this.uid,
    required this.role
  });

  final String uid;
  final UserRole role;

  @override
  List<Object?> get props => [uid, role];
}