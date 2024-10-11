
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:karz/core/errors/db_exception.dart';
import 'package:karz/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:karz/features/authentification/data/models/conductor_model.dart';

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
  Future<ConductorModel> getCurrentUserFromCache() async {
    try {
      final userString = _sharedPreferences.getString(_key);
      final userJson = jsonDecode(userString!);
      return ConductorModel.fromJson(userJson);
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