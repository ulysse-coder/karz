
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';

class ParkingEntity extends Equatable {
  const ParkingEntity({
    required this.id,
    required this.capacity,
    required this.freePlaces,
    required this.reservationPrice,
    required this.type,
    required this.address,
    required this.registeredBy,
    required this.acceptedVehiculeType,
    required this.registeredAt,
  });

  final String id;
  final int capacity;
  final int freePlaces;
  final double reservationPrice;
  final ParkingType type;
  final String address;
  final String registeredBy;
  final DateTime registeredAt;
  final List<VehiculeType> acceptedVehiculeType;

  @override
  List<Object?> get props => [
    id,
    capacity,
    freePlaces,
    reservationPrice,
    type,
    address,
    registeredBy,
    registeredAt,
    acceptedVehiculeType
  ];
}