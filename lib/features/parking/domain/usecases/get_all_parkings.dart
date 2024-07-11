
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class GetAllParkings extends UseCaseWithoutParameters<List<ParkingEntity>> {
  const GetAllParkings(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<List<ParkingEntity>> call() => _repository.getAllParkings();
}