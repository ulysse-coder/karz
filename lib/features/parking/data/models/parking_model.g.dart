// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingModel _$ParkingModelFromJson(Map<String, dynamic> json) => ParkingModel(
      id: json['id'] as String,
      capacity: json['capacity'] as int,
      reservationPrice: (json['reservationPrice'] as num).toDouble(),
      type: $enumDecode(_$ParkingTypeEnumMap, json['type']),
      registeredBy: json['registeredBy'] as String,
      acceptedVehiculeType: (json['acceptedVehiculeType'] as List<dynamic>)
          .map((e) => $enumDecode(_$VehiculeTypeEnumMap, e))
          .toList(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$ParkingModelToJson(ParkingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capacity': instance.capacity,
      'reservationPrice': instance.reservationPrice,
      'type': _$ParkingTypeEnumMap[instance.type]!,
      'address': instance.address,
      'registeredBy': instance.registeredBy,
      'acceptedVehiculeType': instance.acceptedVehiculeType
          .map((e) => _$VehiculeTypeEnumMap[e]!)
          .toList(),
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
