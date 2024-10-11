
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/core/utilities/parking_params.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';

class UploadParkingImage extends UseCaseWithParameters<void, UploadImageParams> {
  const UploadParkingImage(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(UploadImageParams args) => _repository.uploadParkingImage(args.parkingId, args.file);
}