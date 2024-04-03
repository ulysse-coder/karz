
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/parking/data/data_sources/remote/parking_remote_data_source.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class ParkingRepositoryImplemetation extends ParkingRepository {
  ParkingRepositoryImplemetation(this._remoteDataSource);

  final ParkingRemoteDataSource _remoteDataSource;

  @override
  ResultVoid addParking(ParkingEntity parkingEntity) async {
    try {
      await _remoteDataSource.addParking(parkingEntity);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<ParkingEntity> getParking(String parkingId) async {
    try {
      final result = await _remoteDataSource.getParking(parkingId);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<File>> getParkingImages(String parkingId) async {
    try {
      final result = await _remoteDataSource.getParkingImages(parkingId);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultVoid uploadParkingImage(File image) async {
    try {
      await _remoteDataSource.uploadParkingImage(image);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

}