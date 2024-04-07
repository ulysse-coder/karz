
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImplementation(this._auth, this._firestore, this._facebookAuth, this._googleSignIn);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FacebookAuth _facebookAuth;
  final GoogleSignIn _googleSignIn;

  static const String _kConductorsCollection = "conductors";
  static const String _kSecuritiesCollection = "securities";

  @override
  Future<bool> checkIfUserExist(String uid, UserRole role) async {
    try {
      switch (role) {
        case UserRole.conducteur:
          final doc = await _firestore.collection(_kConductorsCollection).doc(uid).get();
          return doc.exists;
        case UserRole.gardien:
          final doc = await _firestore.collection(_kSecuritiesCollection).doc(uid).get();
          return doc.exists;
        case UserRole.defaultRole:
          return false;
      }
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<void> createUser(UserModel user, UserRole role) async {
    
    try {
      switch (role) {
        case UserRole.conducteur:
          final conductor = user as ConductorModel;
          await _firestore.collection(_kConductorsCollection).doc(user.uid).set({
            'name': conductor.name,
            'role': 'conducteur',
          });
          break;
        case UserRole.gardien:
          final securitiy = user as SecurityModel;
          await _firestore.collection(_kSecuritiesCollection).doc(user.uid).set({
            'name': securitiy.name,
            'workDuration': securitiy.workDuration,
            'startAt': securitiy.startAt,
            'endAt': securitiy.endAt,
            'role': 'gardien',
          });
          break;
        case UserRole.defaultRole:
          break;
      }
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getCurrentUser(String uid, UserRole role) async{
    try {
      switch (role) {
        case UserRole.conducteur:
          final doc = await _firestore.collection(_kConductorsCollection).doc(uid).get();
          return ConductorModel.fromDocumentSnapshot(doc);
        case UserRole.gardien:
          final doc = await _firestore.collection(_kSecuritiesCollection).doc(uid).get();
          return SecurityModel.fromDocumentSnapshot(doc);
        case UserRole.defaultRole:
          return const UserModel.empty();
      }
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<UserModel> siginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      return UserModel(
        uid: userCredential.user!.uid, 
        name: userCredential.user!.displayName ?? '',
        phone: '',
        role: UserRole.defaultRole, 
      );
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<UserModel> siginWithFacebook() async {
    final loginResult = await _facebookAuth.login();

    final response = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,email,&access_token=${loginResult.accessToken!.token}'));
    final userProfile = jsonDecode(response.body);

    try {
      
      if (loginResult.status == LoginStatus.success) {
        final oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final userCredential = await _auth.signInWithCredential(oAuthCredential);
        return UserModel(
          uid: userCredential.user!.uid,
          name: userProfile['name'],
          phone: '',
          role: UserRole.defaultRole, 
        );
      }

      throw const DBException(message: 'Could not create user profile');

    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<UserModel> siginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    try {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // signing to firebase user instance
      final User firebaseUser = (await _auth.signInWithCredential(credential)).user!;

      return UserModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName!, 
        phone: '',
        role: UserRole.defaultRole, 
      );
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    _auth.signOut();
    _facebookAuth.logOut();
    _googleSignIn.signOut();
  }
}