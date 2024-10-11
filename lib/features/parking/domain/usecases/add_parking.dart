
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/parking/domain/entities/parking_entity.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';

class AddParking extends UseCaseWithParameters<void, ParkingEntity> {
  const AddParking(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(ParkingEntity args) => _repository.addParking(args);
}