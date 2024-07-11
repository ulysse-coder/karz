
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/entities/place_entity.dart';

abstract class ParkingRepository {

  ResultFuture<ParkingEntity> getParking(String parkingId);

  ResultVoid addParking(ParkingEntity parkingEntity);

  ResultVoid updateParking(ParkingEntity parkingEntity);

  ResultVoid deleteParking(String parkingId);

  ResultFuture<XFile?> selectImageFromGallery();

  ResultVoid uploadParkingImage(String parkingId, XFile file);

  ResultFuture<List<ParkingEntity>> getAllParkings();

  ResultFuture<List<Reference>?> getParkingImages(String parkingId);

  ResultFuture<List<PlaceEntity>> getPlacesByParking(String parkingId);

  ResultVoid addPlace(String parkingId, PlaceEntity place);

  ResultVoid updatePlace(String parkingId, PlaceEntity place);

  ResultVoid deletePlace(String parkingId, PlaceEntity place);

}