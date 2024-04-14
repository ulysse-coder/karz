
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/parking/domain/entities/place_entity.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class GetPlacesByParking extends UseCaseWithParameters<List<PlaceEntity>, String> {
  const GetPlacesByParking(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<List<PlaceEntity>> call(String args) async => await _repository.getPlacesByParking(args);
}