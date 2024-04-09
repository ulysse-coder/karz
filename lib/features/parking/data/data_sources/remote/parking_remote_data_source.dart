
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';
import 'package:ulysse_app/features/parking/data/models/place_model.dart';

abstract class ParkingRemoteDataSource {

  Future<ParkingModel> getParking(String parkingId);

  Future<void> addParking(ParkingModel parking);

  Future<XFile?> selectImageFromGallery();

  Future<void> uploadParkingImage(String parkingId, XFile file);

  Future<List<Reference>?> getParkingImages(String parkingId);

  Future<List<PlaceModel>> getPlacesByParking(String parkingId);

  Future<void> addPlace(String parkingId, PlaceModel place);

  Future<void> updatePlace(String parkingId, PlaceModel place);

  Future<void> deletePlace(String parkingId, PlaceModel place);

}