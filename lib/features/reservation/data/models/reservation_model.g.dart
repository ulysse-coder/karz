// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String,
      conductorId: json['conductor_id'] as String,
      conductorName: json['conductor_name'] as String,
      conductorPhone: json['conductor_phone'] as String,
      vehicule: VehiculeModel.fromJson(json['vehicule'] as Map<String, dynamic>),
      parkingId: json['parking_id'] as String,
      parkingAddress: json['parking_address'] as String,
      place: json['place'] == null
          ? ''
          : json['place'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'conductor_id': instance.conductorId,
      'conductor_name': instance.conductorName,
      'conductor_phone': instance.conductorPhone,
      'vehicule': instance.vehicule.toJson(),
      'parking_id': instance.parkingId,
      'parking_address': instance.parkingAddress,
      'place': instance.place,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'status': _$ReservationStatusEnumMap[instance.status],
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 'pending',
  ReservationStatus.validated: 'validated',
  ReservationStatus.canceled: 'canceled',
  ReservationStatus.finished: 'finished',
};