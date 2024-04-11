// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String,
      conductorId: json['conductorId'] as String,
      conductorName: json['conductorName'] as String,
      conductorPhone: json['conductorPhone'] as String,
      vehicule:
          VehiculeModel.fromJson(json['vehicule'] as Map<String, dynamic>),
      parkingId: json['parkingId'] as String,
      parkingAddress: json['parkingAddress'] as String,
      place: json['place'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conductorId': instance.conductorId,
      'conductorName': instance.conductorName,
      'conductorPhone': instance.conductorPhone,
      'vehicule': instance.vehicule.toJson(),
      'parkingId': instance.parkingId,
      'parkingAddress': instance.parkingAddress,
      'place': instance.place,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'status': _$ReservationStatusEnumMap[instance.status]!,
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 'pending',
  ReservationStatus.validated: 'validated',
  ReservationStatus.canceled: 'canceled',
  ReservationStatus.finished: 'finished',
};
