
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/core/utilities/parking_params.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';

class DeletePlace extends UseCaseWithParameters<void, PlaceCRUDParams> {
  const DeletePlace(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(PlaceCRUDParams args) async => await _repository.deletePlace(args.parkingId, args.place);
}