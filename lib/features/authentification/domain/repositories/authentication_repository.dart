
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/authentification/domain/entities/conductor_entity.dart';
import 'package:karz/features/authentification/domain/entities/security_entity.dart';

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