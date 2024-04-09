
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/core/utilities/parking_params.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';

class AddPlace extends UseCaseWithParameters<void, PlaceCRUDParams> {
  const AddPlace(this._repository);

  final ParkingRepository _repository;

  @override
  ResultFuture<void> call(PlaceCRUDParams args) async => await _repository.addPlace(args.parkingId, args.place);
}