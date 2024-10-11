
import 'package:firebase_storage/firebase_storage.dart';
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';

class GetParkingImages extends UseCaseWithParameters<List<Reference>?, String> {
  const GetParkingImages(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<List<Reference>?> call(String args) => _repository.getParkingImages(args);
}