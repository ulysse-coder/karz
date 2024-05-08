
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:ulysse_app/features/authentification/data/models/bank_account_model.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';
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
  Future<void> createConductor({required ConductorModel conductor}) async {
    try {
      await _firestore.collection(_kConductorsCollection).doc(conductor.uid).set({
        'name': conductor.name,
        'phone': conductor.phone,
        'bank_accounts': []
      });
    } catch (e) {
      debugPrint("====== Erreur lors de la creation du conducteur: ${e.toString()}");
      throw DBException(message: e.toString());
    }
  }
  
  @override
  Future<void> createSecurity({required SecurityModel security}) async {
    try {
      await _firestore.collection(_kSecuritiesCollection).doc(security.uid).set({
        'name': security.name,
        'phone': security.phone,
      });
    } catch (e) {
      debugPrint("====== Erreur lors de la creation: ${e.toString()}");
      throw DBException(message: e.toString());
    }
  }
  
  @override
  Future<ConductorModel> getConductor({required String id}) async {
    try {
      final doc = await _firestore
        .collection(_kConductorsCollection)
        .doc(id)
        .get();
      return ConductorModel.fromDocumentSnapshot(doc);
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }

  @override
  Future<SecurityModel> getSecurity({required String id}) async {
    try {
      final doc = await _firestore
        .collection(_kSecuritiesCollection)
        .doc(id)
        .get();
      return SecurityModel.fromDocumentSnapshot(doc);
    } catch (e) {
      throw(DBException(message: e.toString()));
    }
  }
  
  @override
  Future<ConductorModel> siginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      return ConductorModel(
        uid: userCredential.user!.uid,
        name: '',
        phone: '',
        bankAccounts: const <BankAccountModel>[]
      );
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<ConductorModel> siginWithFacebook() async {
    final loginResult = await _facebookAuth.login();

    final response = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,email,&access_token=${loginResult.accessToken!.token}'));
    final userProfile = jsonDecode(response.body);

    try {
      
      if (loginResult.status == LoginStatus.success) {
        final oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final userCredential = await _auth.signInWithCredential(oAuthCredential);
        return ConductorModel(
          uid: userCredential.user!.uid,
          name: userProfile['name'],
          phone: '',
          bankAccounts: const <BankAccountModel>[]
        );
      }

      throw const DBException(message: 'Could not create user profile');

    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<ConductorModel> siginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    try {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // signing to firebase user instance
      final User firebaseUser = (await _auth.signInWithCredential(credential)).user!;

      return ConductorModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName!,
        phone: '',
        bankAccounts: const <BankAccountModel>[]
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