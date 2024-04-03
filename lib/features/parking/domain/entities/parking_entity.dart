
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';

class ParkingEntity extends Equatable {
  const ParkingEntity({
    required this.id,
    required this.capacity,
    required this.reservationPrice,
    required this.type,
    required this.address,
    required this.registeredBy,
    required this.acceptedVehiculeType
  });

  final String id;
  final int capacity;
  final double reservationPrice;
  final ParkingType type;
  final String address;
  final String registeredBy;
  final List<VehiculeType> acceptedVehiculeType;

  @override
  List<Object?> get props => [
    id,
    capacity,
    reservationPrice,
    type,
    address,
    registeredBy,
    acceptedVehiculeType
  ];
}