
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/reservation/domain/entities/reservation_entity.dart';
import 'package:karz/features/reservation/domain/repositories/reservation_repository.dart';

class UpdateReservation extends UseCaseWithParameters<void, ReservationEntity> {
  UpdateReservation(this.repository);

  final ReservationRepository repository;

  @override
  ResultVoid call(ReservationEntity args) async => await repository.updateReservation(args);
}