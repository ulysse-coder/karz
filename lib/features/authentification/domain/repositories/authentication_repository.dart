
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {

  ResultVoid createUser(
    String id,
    String name,
    String phone,
    UserRole role,
    int workDuration,
    DateTime startAt,
    DateTime endAt
  );

  ResultFuture<UserEntity> getCurrentUser(String uid, UserRole role);

  ResultBool checkIfUserExist(String uid, UserRole role);

  ResultBool getUserLoggingState();

  ResultVoid setUserLoggingState();

  ResultFuture<UserEntity> siginWithFacebook();

  ResultFuture<UserEntity> siginWithGoogle();

  ResultFuture<UserEntity> siginWithEmailAndPassword(String email, String password);

  ResultVoid signOut();

  ResultVoid saveCurrentUserToCache(UserEntity user);

  ResultFuture<UserEntity> getCurrentUserFromCache();

}