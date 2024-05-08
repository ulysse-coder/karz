
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

abstract class AuthenticationLocalDataSource {

  Future<bool> getUserLoggingState();
  Future<void> setUserLoggingState();
  Future<void> saveCurrentUserToCache(String user);
  Future<UserModel> getCurrentUserFromCache();

}