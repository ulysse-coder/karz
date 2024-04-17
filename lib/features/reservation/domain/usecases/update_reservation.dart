
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/reservation/domain/entities/reservation_entity.dart';
import 'package:ulysse_app/features/reservation/domain/repositories/reservation_repository.dart';

class UpdateReservation extends UseCaseWithParameters<void, ReservationEntity> {
  UpdateReservation(this.repository);

  final ReservationRepository repository;

  @override
  ResultVoid call(ReservationEntity args) async => await repository.updateReservation(args);
}