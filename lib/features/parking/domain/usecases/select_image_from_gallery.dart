
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class SelectImageFromGallery extends UseCaseWithoutParameters<XFile?> {
  const SelectImageFromGallery(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<XFile?> call() => _repository.selectImageFromGallery();
}