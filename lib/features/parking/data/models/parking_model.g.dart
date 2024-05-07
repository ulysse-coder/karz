// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingModel _$ParkingModelFromJson(Map<String, dynamic> json) => ParkingModel(
      id: json['id'] as String,
      capacity: json['capacity'] as int,
      freePlaces: json['free_places'] as int,
      reservationPrice: (json['reservation_price'] as num).toDouble(),
      type: $enumDecode(_$ParkingTypeEnumMap, json['type']),
      registeredBy: json['registered_by'] as String,
      registeredAt: json['registered_at'] as String,
      acceptedVehiculeType: (json['accepted_vehicule_type'] as List<dynamic>)
          .map((e) => $enumDecode(_$VehiculeTypeEnumMap, e))
          .toList(),
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      reviewsNumber: json['reviewsNumber'] as int? ?? 0,
    );

Map<String, dynamic> _$ParkingModelToJson(ParkingModel instance) =>
    <String, dynamic>{
      // 'id': instance.id,
      'capacity': instance.capacity,
      'free_places': instance.freePlaces,
      'reservation_price': instance.reservationPrice,
      'type': _$ParkingTypeEnumMap[instance.type]!,
      'address': instance.address.toJson(),
      'registered_by': instance.registeredBy,
      'registered_at': instance.registeredAt,
      'accepted_vehicule_type': instance.acceptedVehiculeType
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
