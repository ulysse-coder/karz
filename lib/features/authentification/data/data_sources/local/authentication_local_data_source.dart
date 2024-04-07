
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

abstract class AuthenticationLocalDataSource {

  Future<void> saveCurrentUserToCache(UserModel user);
  Future<UserModel> getCurrentUserFromCache();

}