
import 'package:dartz/dartz.dart';
import 'package:karz/core/errors/db_exception.dart';
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/features/reservation/data/data_sources/remote/reservation_remote_data_source.dart';
import 'package:karz/features/reservation/data/models/reservation_model.dart';
import 'package:karz/features/reservation/domain/entities/reservation_entity.dart';
import 'package:karz/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationRespositoryImplementation implements ReservationRepository {
  const ReservationRespositoryImplementation(this._remoteDataSource);

  final ReservationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid cancelReservation(String id) async {
    try {
      await _remoteDataSource.cancelReservation(id);

      return const Right(null);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid createReservation(ReservationEntity reservation) async {
    try {
      await _remoteDataSource.createReservation(reservation as ReservationModel);

      return const Right(null);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<ReservationEntity> getReservation(String id) async {
    try {
      final result = await _remoteDataSource.getReservation(id);

      return Right(result);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<ReservationEntity>> getReservationByParking(String parkingId) async {
    try {
      final result = await _remoteDataSource.getReservationByParking(parkingId);

      return Right(result);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<ReservationEntity>> getReservationsByUser(String userId) async {
    try {
      final result = await _remoteDataSource.getReservationsByUser(userId);

      return Right(result);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid updateReservation(ReservationEntity reservation) async {
    try {
      await _remoteDataSource.updateReservation(reservation as ReservationModel);

      return const Right(null);

    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

}