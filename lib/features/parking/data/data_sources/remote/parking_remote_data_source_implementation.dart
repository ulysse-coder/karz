
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/errors/db_exception.dart';
import 'package:ulysse_app/features/parking/data/data_sources/remote/parking_remote_data_source.dart';
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';

class ParkingRemoteDataSourceImplementation implements ParkingRemoteDataSource {
  const ParkingRemoteDataSourceImplementation(this._firestore, this._firebaseStorage, this._imagePicker);

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final ImagePicker _imagePicker;

  static const _kParkingCollection = 'parking';

  @override
  Future<void> addParking(ParkingModel parking) async {
    try {
      await _firestore
        .collection(_kParkingCollection)
        .add(parking.toJson());
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<ParkingModel> getParking(String parkingId) async {
    try {
      final doc = await _firestore
        .collection(_kParkingCollection)
        .doc(parkingId)
        .get();

      return ParkingModel.fromDocumentSnapshot(doc);
    } catch (e) {
      throw DBException(message: e.toString());      
    }
  }

  @override
  Future<List<Reference>?> getParkingImages(String parkingId) async {
    try {
      final storageRef = _firebaseStorage.ref();
      final imagesDirRef = storageRef.child("$parkingId/images/");
      final images = await imagesDirRef.listAll();

      return images.items;
    } catch (e) {
      throw DBException(message: e.toString());      
    }
  }

  @override
  Future<XFile?> selectImageFromGallery() async {
    try {
      return await _imagePicker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      throw DBException(message: e.toString());
    }
  }

  @override
  Future<void> uploadParkingImage(String parkingId, XFile file) async {

    try {
      final fileName = "${DateTime.now().microsecondsSinceEpoch}-${file.name}";

      final ref = _firebaseStorage.ref()
        .child("$parkingId/images/$fileName");

      await ref.putFile(File(file.path));
      
    } catch (e) {
      throw DBException(message: e.toString());      
    }
  }
}