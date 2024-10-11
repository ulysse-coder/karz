
import 'package:karz/features/parking/data/models/parking_model.dart';

class PublicParkingModel extends ParkingModel {
  const PublicParkingModel({
    required super.id,
    required super.capacity,
    required super.freePlaces,
    required super.type,
    required super.acceptedVehiculeType,
    required super.registeredBy,
    required super.registeredAt,
    required super.reservationPrice,
    required super.address,
  });
}