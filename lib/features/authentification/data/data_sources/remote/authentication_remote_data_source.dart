
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  Future<void> createConductor({
    required ConductorModel conductor
  });

  Future<ConductorModel> getConductor({
    required String id
  });
  
  Future<SecurityModel> getSecurity({
    required String id
  });

  Future<void> createSecurity({
    required SecurityModel security
  });

  Future<bool> checkIfUserExist(String uid, UserRole role);

  Future<ConductorModel> siginWithFacebook();

  Future<ConductorModel> siginWithGoogle();

  Future<ConductorModel> siginWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}