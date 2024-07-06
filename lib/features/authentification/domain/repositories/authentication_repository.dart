
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/security_entity.dart';

abstract class AuthenticationRepository {

  ResultVoid createConductor({
    required ConductorEntity conductor
  });

  ResultFuture<ConductorEntity> getConductor({
    required String id
  });

  ResultVoid createSecurity({
    required SecurityEntity security
  });

  ResultFuture<SecurityEntity> getSecurity({
    required String id
  });

  ResultBool checkIfUserExist(String uid, UserRole role);

  ResultBool getUserLoggingState();

  ResultVoid setUserLoggingState();

  ResultFuture<ConductorEntity> siginWithFacebook();

  ResultFuture<ConductorEntity> siginWithGoogle();

  ResultFuture<ConductorEntity> siginWithEmailAndPassword(String email, String password);

  ResultVoid signOut();

  ResultVoid saveCurrentUserToCache(String user);

  ResultFuture<ConductorEntity> getCurrentUserFromCache();

}