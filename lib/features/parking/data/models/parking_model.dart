
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';

part 'parking_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ParkingModel extends ParkingEntity {
  const ParkingModel({
    required super.id,
    required super.capacity,
    required super.reservationPrice,
    required super.type,
    required super.registeredBy,
    required super.acceptedVehiculeType,
    required super.address
  });

  ParkingModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    id: doc.id,
    capacity: doc['capacity'],
    reservationPrice: doc['reservation_price'],
    type: doc['type'],
    registeredBy: doc['registered_by'],
    acceptedVehiculeType: doc['accepted_vehicule_type'],
    address: doc['address'],
  );
}