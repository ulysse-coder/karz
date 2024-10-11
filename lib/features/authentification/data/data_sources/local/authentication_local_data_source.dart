
import 'package:karz/features/authentification/data/models/conductor_model.dart';

abstract class AuthenticationLocalDataSource {

  Future<bool> getUserLoggingState();
  Future<void> setUserLoggingState();
  Future<void> saveCurrentUserToCache(String user);
  Future<ConductorModel> getCurrentUserFromCache();

}