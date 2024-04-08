
import 'package:ulysse_app/core/typedef/typedef.dart';
import 'package:ulysse_app/features/reservation/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {

  ResultFuture<ReservationEntity> getReservation(String id);

  ResultFuture<List<ReservationEntity>> getReservationByParking(String parkingId);

  ResultFuture<List<ReservationEntity>> getReservationsByUser(String userId);

  ResultVoid createReservation(ReservationEntity reservation);

  ResultVoid updateReservation(ReservationEntity reservation);

  ResultVoid cancelReservation(String id);

}