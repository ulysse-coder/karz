
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/parking_params.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class UploadParkingImage extends UseCaseWithParameters<void, UploadImageParams> {
  const UploadParkingImage(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(UploadImageParams args) => _repository.uploadParkingImage(args.parkingId, args.file);
}