
import 'dart:io';

import 'package:ulysse_app/features/parking/data/models/parking_model.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingRemoteDataSource {

  Future<ParkingModel> getParking(String parkingId);

  Future<void> addParking(ParkingEntity parkingEntity);

  Future<void> uploadParkingImage(File image);

  Future<List<File>> getParkingImages(String parkingId);

}