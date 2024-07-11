// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => PlaceModel(
      id: json['id'] ?? '',
      name: json['name'] as String,
      status: $enumDecode(_$PlaceStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
    <String, dynamic>{
      // 'id': instance.id,
      'name': instance.name,
      'status': _$PlaceStatusEnumMap[instance.status]!,
    };

const _$PlaceStatusEnumMap = {
  PlaceStatus.reserved: 'reserved',
  PlaceStatus.occupied: 'occupied',
  PlaceStatus.free: 'free',
};
