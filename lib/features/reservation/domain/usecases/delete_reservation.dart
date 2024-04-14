
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/core/usecases/usecases.dart';
import 'package:ulysse_app/features/reservation/domain/repositories/reservation_repository.dart';

class CancelReservation extends UseCaseWithParameters<void, String> {
  CancelReservation(this.repository);

  final ReservationRepository repository;

  @override
  ResultVoid call(String args) async => await repository.cancelReservation(args);
}