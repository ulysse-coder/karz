
import 'dart:io';

import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingRepository {

  ResultFuture<ParkingEntity> getParking(String parkingId);

  ResultVoid addParking(ParkingEntity parkingEntity);

  ResultVoid uploadParkingImage(File image);

  ResultFuture<List<File>> getParkingImages(String parkingId);

}