
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/parking/data/models/place_model.dart';
import 'package:ulysse_app/features/reservation/data/models/vehicule_model.dart';

class ReservationEntity extends Equatable {
  const ReservationEntity({
    required this.id,
    required this.conductorId,
    required this.conductorName,
    required this.conductorPhone,
    required this.vehicule,
    required this.parkingId,
    required this.parkingAddress,
    required this.place,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  final String id;
  final String conductorId;
  final String conductorName;
  final String conductorPhone;
  final VehiculeModel vehicule;
  final String parkingId;
  final String parkingAddress;
  final PlaceModel place;
  final String date;
  final String startTime;
  final String endTime;
  final ReservationStatus status;

  @override
  List<Object> get props => [id, conductorId, conductorName, conductorPhone, vehicule, parkingId, parkingAddress, place, date, startTime, endTime, status];

}