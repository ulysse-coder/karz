
import 'package:get/get.dart';
import 'package:ulysse_app/features/reservation/data/models/reservation_model.dart';

class ReservationController extends GetxController {
  final _reservations = <ReservationModel>[].obs;
  final _currentReservation = ReservationModel.empty().obs;

  ReservationModel get currentReservation => _currentReservation.value;
  set currentReservation(ReservationModel value) => _currentReservation.value = value;

  List<ReservationModel> get reservations => _reservations;
  set reservations(List<ReservationModel> value) => _reservations.value = value;
}