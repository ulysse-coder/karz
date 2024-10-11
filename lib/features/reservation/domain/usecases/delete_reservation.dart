
import 'package:karz/core/typedef/typedef.dart';
import 'package:karz/core/usecases/usecases.dart';
import 'package:karz/features/reservation/domain/repositories/reservation_repository.dart';

class CancelReservation extends UseCaseWithParameters<void, String> {
  CancelReservation(this.repository);

  final ReservationRepository repository;

  @override
  ResultVoid call(String args) async => await repository.cancelReservation(args);
}