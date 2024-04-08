// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String,
      conductorId: json['id_conducteur'] as String,
      conductorName: json['nom_conducteur'] as String,
      conductorPhone: json['phone_conducteur'] as String,
      vehicule: VehiculeModel.fromJson(json['vehicule'] as Map<String, dynamic>),
      parkingId: json['parking_id'] as String,
      parkingAddress: json['parkingAddress'] as String,
      place: json['place'] == null
          ? PlaceModel.empty()
          : PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id_conducteur': instance.conductorId,
      'nom_conducteur': instance.conductorName,
      'phone_conducteur': instance.conductorPhone,
      'vehicule': instance.vehicule.toJson(),
      'parking_id': instance.parkingId,
      'parkingAddress': instance.parkingAddress,
      'place': instance.place?.toJson(),
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'status': instance.status,
    };
