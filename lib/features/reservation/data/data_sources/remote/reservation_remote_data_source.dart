
import 'package:ulysse_app/features/reservation/data/models/reservation_model.dart';

abstract class ReservationRemoteDataSource {

    Future<ReservationModel> getReservation(String id);

    Future<List<ReservationModel>> getReservationByParking(String parkingId);

    Future<List<ReservationModel>> getReservationsByUser(String userId);

    Future<void> createReservation(ReservationModel reservation);

    Future<void> updateReservation(ReservationModel reservation);

    Future<void> cancelReservation(String id);

}