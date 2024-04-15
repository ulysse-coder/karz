
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class AddParking extends UseCaseWithParameters<void, ParkingEntity> {
  const AddParking(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(ParkingEntity args) => _repository.addParking(args);
}