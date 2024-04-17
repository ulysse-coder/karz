
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/reservation/domain/entities/reservation_entity.dart';
import 'package:ulysse_app/features/reservation/domain/repositories/reservation_repository.dart';

class CreateReservation extends UseCaseWithParameters<void, ReservationEntity> {
  const CreateReservation(this._repository);

  final ReservationRepository _repository;

  @override
  ResultFuture<void> call(ReservationEntity args) async => await _repository.createReservation(args);
}