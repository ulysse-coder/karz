// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingModel _$ParkingModelFromJson(Map<String, dynamic> json) => ParkingModel(
      id: json['id'] as String,
      capacity: json['capacity'] as int,
      freePlaces: json['freePlaces'] as int,
      reservationPrice: (json['reservationPrice'] as num).toDouble(),
      type: $enumDecode(_$ParkingTypeEnumMap, json['type']),
      registeredBy: json['registeredBy'] as String,
      registeredAt: DateTime.parse(json['registeredAt'] as String),
      acceptedVehiculeType: (json['acceptedVehiculeType'] as List<dynamic>)
          .map((e) => $enumDecode(_$VehiculeTypeEnumMap, e))
          .toList(),
      address: json['address'] as String,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      reviewsNumber: json['reviewsNumber'] as int? ?? 0,
    );

Map<String, dynamic> _$ParkingModelToJson(ParkingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capacity': instance.capacity,
      'freePlaces': instance.freePlaces,
      'reservationPrice': instance.reservationPrice,
      'type': _$ParkingTypeEnumMap[instance.type]!,
      'address': instance.address,
      'registeredBy': instance.registeredBy,
      'registeredAt': instance.registeredAt.toIso8601String(),
      'acceptedVehiculeType': instance.acceptedVehiculeType
          .map((e) => _$VehiculeTypeEnumMap[e]!)
          .toList(),
      'rate': instance.rate,
      'reviewsNumber': instance.reviewsNumber,
    };

const _$ParkingTypeEnumMap = {
  ParkingType.private: 'private',
  ParkingType.public: 'public',
};

const _$VehiculeTypeEnumMap = {
  VehiculeType.deuxRoues: 'deuxRoues',
  VehiculeType.voiture: 'voiture',
  VehiculeType.miniBus: 'miniBus',
};
