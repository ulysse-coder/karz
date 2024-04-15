
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

class AuthenticationLocalDataSourceImplementation implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImplementation(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _key = 'user';


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
  Future<void> saveCurrentUserToCache(UserModel user) async {
    try {
      final userJson = user.toJson();
      final userString = jsonEncode(userJson);
      await _sharedPreferences.setString(_key, userString);
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }
}