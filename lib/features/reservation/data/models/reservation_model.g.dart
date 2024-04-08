// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String,
      conductorName: json['conductorName'] as String,
      conductorPhone: json['conductorPhone'] as String,
      vehicule: VehiculeModel.fromJson(json['vehicule'] as Map<String, dynamic>),
      parkingId: json['parkingId'] as String,
      parkingAddress: json['parkingAddress'] as String,
      place: json['place'] == null
          ? PlaceModel.empty()
          : PlaceModel.fromJson(json['place'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conductorName': instance.conductorName,
      'conductorPhone': instance.conductorPhone,
      'vehicule': instance.vehicule.toJson(),
      'parkingId': instance.parkingId,
      'parkingAddress': instance.parkingAddress,
      'place': instance.place?.toJson(),
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'status': instance.status,
    };
