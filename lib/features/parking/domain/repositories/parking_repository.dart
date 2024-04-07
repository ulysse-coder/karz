
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingRepository {

  ResultFuture<ParkingEntity> getParking(String parkingId);

  ResultVoid addParking(ParkingEntity parkingEntity);

  ResultFuture<XFile?> selectImageFromGallery();

  ResultVoid uploadParkingImage(String parkingId, XFile file);

  ResultFuture<List<Reference>?> getParkingImages(String parkingId);

}