
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karz/features/parking/data/models/parking_model.dart';
import 'package:karz/features/parking/data/models/place_model.dart';

abstract class ParkingRemoteDataSource {

  Future<ParkingModel> getParking(String parkingId);

  Future<void> addParking(ParkingModel parking);

  Future<void> updateParking(ParkingModel parking);

  Future<void> deleteParking(String parkingId);

  Future<XFile?> selectImageFromGallery();

  Future<void> uploadParkingImage(String parkingId, XFile file);

  Future<List<ParkingModel>> getAllParkings();

  Future<List<Reference>?> getParkingImages(String parkingId);

  Future<List<PlaceModel>> getPlacesByParking(String parkingId);

  Future<void> addPlace(String parkingId, PlaceModel place);

  Future<void> updatePlace(String parkingId, PlaceModel place);

  Future<void> deletePlace(String parkingId, PlaceModel place);

}