// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiculeModel _$VehiculeModelFromJson(Map<String, dynamic> json) =>
    VehiculeModel(
      matricule: json['matricule'] as String,
      type: $enumDecode(_$VehiculeTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$VehiculeModelToJson(VehiculeModel instance) =>
    <String, dynamic>{
      'matricule': instance.matricule,
      'type': _$VehiculeTypeEnumMap[instance.type]!,
    };

const _$VehiculeTypeEnumMap = {
  VehiculeType.deuxRoues: 'deuxRoues',
  VehiculeType.voiture: 'voiture',
  VehiculeType.miniBus: 'miniBus',
};
