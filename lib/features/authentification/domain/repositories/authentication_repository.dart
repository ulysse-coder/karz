
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {

  ResultVoid createUser(UserEntity user);

  ResultFuture<UserEntity> getCurrentUser(String uid);

  ResultBool checkIfUserExist(String uid);

  ResultFuture<UserEntity> siginWithFacebook();

  ResultFuture<UserEntity> siginWithGoogle();

  ResultFuture<UserEntity> siginWithEmailAndPassword(String email, String password);

  ResultVoid signOut();

}