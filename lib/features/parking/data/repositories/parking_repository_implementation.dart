
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/parking/data/data_sources/remote/parking_remote_data_source.dart';
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';
import 'package:ulysse_app/features/parking/data/models/place_model.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/entities/place_entity.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class ParkingRepositoryImplemetation extends ParkingRepository {
  ParkingRepositoryImplemetation(this._remoteDataSource);

  final ParkingRemoteDataSource _remoteDataSource;

  @override
  ResultVoid addParking(ParkingEntity parkingEntity) async {
    try {
      await _remoteDataSource.addParking(parkingEntity as ParkingModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid deleteParking(String parkingId) async {
    try {
      await _remoteDataSource.deleteParking(parkingId);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultVoid updateParking(ParkingEntity parkingEntity ) async {
    try {
      await _remoteDataSource.updateParking(parkingEntity as ParkingModel);
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
  ResultFuture<List<Reference>?> getParkingImages(String parkingId) async {
    try {
      final result = await _remoteDataSource.getParkingImages(parkingId);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultVoid uploadParkingImage(String parkingId, XFile file) async {
    try {
      await _remoteDataSource.uploadParkingImage(parkingId, file);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }
  
  @override
  ResultFuture<XFile?> selectImageFromGallery() async {
    try {
      final result = await _remoteDataSource.selectImageFromGallery();
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid addPlace(String parkingId, PlaceEntity place) async {
    try {
      await _remoteDataSource.addPlace(parkingId, place as PlaceModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid deletePlace(String parkingId, PlaceEntity place) async {
    try {
      await _remoteDataSource.deletePlace(parkingId, place as PlaceModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<PlaceEntity>> getPlacesByParking(String parkingId) async {
    try {
      final result = await _remoteDataSource.getPlacesByParking(parkingId);
      return Right(result);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

  @override
  ResultVoid updatePlace(String parkingId, PlaceEntity place) async {
    try {
      await _remoteDataSource.updatePlace(parkingId, place as PlaceModel);
      return const Right(null);
    } catch (e) {
      return Left(DBException(message: e.toString()));
    }
  }

}