
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  Future<void> createUser(
    String id,
    String name,
    String phone,
    UserRole role,
    int workDuration,
    DateTime startAt,
    DateTime endAt
  );

  Future<UserModel> getCurrentUser(String uid, UserRole role);

  Future<bool> checkIfUserExist(String uid, UserRole role);

  Future<UserModel> siginWithFacebook();

  Future<UserModel> siginWithGoogle();

  Future<UserModel> siginWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}