
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/parking/domain/entities/parking_entity.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';

class GetParking extends UseCaseWithParameters<ParkingEntity, String> {
  const GetParking(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<ParkingEntity> call(String args) => _repository.getParking(args);
}