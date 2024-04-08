
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/features/parking/data/models/place_model.dart';
import 'package:ulysse_app/features/reservation/data/models/vehicule_model.dart';

class ReservationEntity extends Equatable {
  const ReservationEntity({
    required this.id,
    required this.conductorName,
    required this.conductorPhone,
    required this.vehicule,
    required this.parkingId,
    required this.parkingAddress,
    this.place,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  final String id;
  final String conductorName;
  final String conductorPhone;
  final VehiculeModel vehicule;
  final String parkingId;
  final String parkingAddress;
  final PlaceModel? place;
  final DateTime startTime;
  final DateTime endTime;
  final String status;

  @override
  List<Object> get props => [id, conductorName, conductorPhone, vehicule, parkingId, parkingAddress, place!, startTime, endTime, status];

}