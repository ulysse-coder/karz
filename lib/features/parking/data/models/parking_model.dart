
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
    required super.freePlaces,
    required super.reservationPrice,
    required super.type,
    required super.registeredBy,
    required super.registeredAt,
    required super.acceptedVehiculeType,
    required super.address
  });

  ParkingModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    id: doc.id,
    capacity: doc['capacity'],
    freePlaces: doc['free_places'],
    reservationPrice: doc['reservation_price'],
    type: _$ParkingTypeEnumMap.keys.toList()[_$ParkingTypeEnumMap.values.toList().indexOf(doc['type'])],
    registeredBy: doc['registered_by'],
    registeredAt: doc['registered_at'].toDate(),
    acceptedVehiculeType: doc['accepted_vehicule_type']
      .map((type) => _$VehiculeTypeEnumMap.keys.toList()[_$VehiculeTypeEnumMap.values.toList().indexOf(type)])
      .toList(),
    address: doc['address'],
  );

  Map<String, dynamic> toJson() => _$ParkingModelToJson(this);
}