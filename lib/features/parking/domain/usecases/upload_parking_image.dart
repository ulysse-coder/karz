
import 'dart:io';

import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class UploadParkingImage extends UseCaseWithParameters<void, File> {
  const UploadParkingImage(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(File args) => _repository.uploadParkingImage(args);
}