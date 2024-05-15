
import 'package:dartz/dartz.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';
import 'package:ulysse_app/features/authentification/domain/entities/conductor_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/security_entity.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource, this._localDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;
  final AuthenticationLocalDataSource _localDataSource;

  @override
  ResultBool checkIfUserExist(String uid, UserRole role) async {
    try {
      final result = await _remoteDataSource.checkIfUserExist(uid, role);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultBool getUserLoggingState() async {
    try {
      final result = await _localDataSource.getUserLoggingState();
      return Right(result);
    } catch(e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid setUserLoggingState() async {
    try {
      await _localDataSource.setUserLoggingState();
      return const Right(null);
    } catch(e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<ConductorEntity> siginWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _remoteDataSource.siginWithEmailAndPassword(email, password);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<ConductorEntity> siginWithFacebook() async {
    try {
      final result = await _remoteDataSource.siginWithFacebook();
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<ConductorEntity> siginWithGoogle() async {
    try {
      final result = await _remoteDataSource.siginWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid signOut() async {
    try {
      await _remoteDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultFuture<ConductorEntity> getCurrentUserFromCache() async {
    try {
      final result = await _localDataSource.getCurrentUserFromCache();
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultVoid saveCurrentUserToCache(String user) async {
    try {
      await _localDataSource.saveCurrentUserToCache(user);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid createConductor({required ConductorEntity conductor}) async {
    try {
      await _remoteDataSource.createConductor(conductor:  conductor as ConductorModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid createSecurity({required SecurityEntity security}) async {
    try {
      await _remoteDataSource.createSecurity(security:  security as SecurityModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultFuture<ConductorEntity> getConductor({required String id}) async {
    try {
      final result = await _remoteDataSource.getConductor(id: id);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultFuture<SecurityEntity> getSecurity({required String id}) async {
    try {
      final result = await _remoteDataSource.getSecurity(id: id);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
}