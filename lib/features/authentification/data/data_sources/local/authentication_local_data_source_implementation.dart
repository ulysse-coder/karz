
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

class AuthenticationLocalDataSourceImplementation implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImplementation(this._auth, this._sharedPreferences);

  final FirebaseAuth _auth;
  final SharedPreferences _sharedPreferences;

  static const _key = 'user';

  final kIsUserLoggedIn = 'logging_state';

  @override
  Future<void> setUserLoggingState() async {
    final isUserLoggedIn = _auth.currentUser != null;
    await _sharedPreferences.setBool(kIsUserLoggedIn, isUserLoggedIn);
  }

  @override
  Future<bool> getUserLoggingState() async {
    return _sharedPreferences.getBool(kIsUserLoggedIn) ?? false;
  }

  @override
  Future<UserModel> getCurrentUserFromCache() async {
    try {
      final userString = _sharedPreferences.getString(_key);
      final userJson = jsonDecode(userString!);
      return UserModel.fromJson(userJson);
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<void> saveCurrentUserToCache(String user) async {
    try {
      await _sharedPreferences.setString(_key, user);
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }
}