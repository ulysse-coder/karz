
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';

abstract class ParkingRemoteDataSource {

  Future<ParkingModel> getParking(String parkingId);

  Future<void> addParking(ParkingModel parking);

  Future<XFile?> selectImageFromGallery();

  Future<void> uploadParkingImage(String parkingId, XFile file);

  Future<List<Reference>?> getParkingImages(String parkingId);

}