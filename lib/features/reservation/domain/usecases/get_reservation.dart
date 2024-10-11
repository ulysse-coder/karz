
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/reservation/domain/entities/reservation_entity.dart';
import 'package:karz/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservation extends UseCaseWithParameters<ReservationEntity, String> {
  const GetReservation(this._repository);

  final ReservationRepository _repository;

  @override
  ResultFuture<ReservationEntity> call(String args) async => await _repository.getReservation(args);
}