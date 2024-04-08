
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';
// import 'package:ulysse_app/features/parking/data/models/place_model.dart';

class PrivateParkingModel extends ParkingModel {
  const PrivateParkingModel({
    required super.id,
    required super.capacity,
    required super.type,
    required super.reservationPrice,
    required super.acceptedVehiculeType,
    required super.registeredBy,
    required super.registeredAt,
    required super.address, 
  });

  @override
  List<Object?> get props => [
    id,
    capacity,
    type,
    reservationPrice,
    acceptedVehiculeType,
    registeredBy,
    address,
  ];
}