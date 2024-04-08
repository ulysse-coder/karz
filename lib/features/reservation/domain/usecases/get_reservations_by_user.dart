
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/reservation/domain/entities/reservation_entity.dart';
import 'package:ulysse_app/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservationsByUser extends UseCaseWithParameters<List<ReservationEntity>, String> {
  GetReservationsByUser(this._repository);

  final ReservationRepository _repository;

  @override
  ResultFuture<List<ReservationEntity>> call(String args) async => await _repository.getReservationsByUser(args);

}