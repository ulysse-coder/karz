
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/parking/data/models/address_model.dart';
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
    required super.address,
    super.rate,
    super.reviewsNumber
  });

  ParkingModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    id: doc.id,
    capacity: (doc['capacity'] as num).toDouble(),
    freePlaces: (doc['free_places'] as num).toDouble(),
    reservationPrice: (doc['reservation_price'] as num).toDouble(),
    type: $enumDecode(_$ParkingTypeEnumMap, doc['type']),
    registeredBy: doc['registered_by'] as String,
    registeredAt: doc['registered_at'] as String,
    acceptedVehiculeType: (doc['accepted_vehicule_type'] as List<dynamic>)
        .map((e) => $enumDecode(_$VehiculeTypeEnumMap, e))
        .toList(),
    address: AddressModel.fromJson(doc['address'] as Map<String, dynamic>),
    rate: (doc['rate'] as num?)?.toDouble() ?? 0,
    reviewsNumber: (doc['reviews_number'] as num?)?.toDouble() ?? 0,
  );

  ParkingModel.empty() : this(
    id: '',
    capacity: 0,
    freePlaces: 0,
    reservationPrice: 0,
    type: ParkingType.defaultType,
    registeredBy: '',
    registeredAt: '',
    acceptedVehiculeType: [],
    address: AddressModel.empty(),
  );

  Map<String, dynamic> toJson() => _$ParkingModelToJson(this);
}