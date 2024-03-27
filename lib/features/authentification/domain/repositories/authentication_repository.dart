
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {

  ResultVoid createUser(UserEntity user, UserRole role);

  ResultFuture<UserEntity> getCurrentUser(String uid, UserRole role);

  ResultBool checkIfUserExist(String uid);

  ResultFuture<UserEntity> siginWithFacebook();

  ResultFuture<UserEntity> siginWithGoogle();

  ResultFuture<UserEntity> siginWithEmailAndPassword(String email, String password);

  ResultVoid signOut();

}