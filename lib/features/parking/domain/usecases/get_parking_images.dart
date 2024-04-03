
import 'dart:io';

import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class GetParkingImages extends UseCaseWithParameters<List<File>, String> {
  const GetParkingImages(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<List<File>> call(String args) => _repository.getParkingImages(args);
}