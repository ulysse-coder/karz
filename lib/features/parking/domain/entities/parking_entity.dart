
import 'package:equatable/equatable.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/parking/data/models/address_model.dart';

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
    this.rate = 0,
    this.reviewsNumber = 0
  });

  final String id;
  final double capacity;
  final double freePlaces;
  final double reservationPrice;
  final ParkingType type;
  final AddressModel address;
  final String registeredBy;
  final String registeredAt;
  final List<VehiculeType> acceptedVehiculeType;
  final double? rate;
  final double? reviewsNumber;

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
    acceptedVehiculeType,
    rate!,
    reviewsNumber!
  ];
}