
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/parking/data/models/place_model.dart';
import 'package:karz/features/reservation/data/models/vehicule_model.dart';
import 'package:karz/features/reservation/domain/entities/reservation_entity.dart';

part 'reservation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReservationModel extends ReservationEntity {
  const ReservationModel({
    required super.id,
    required super.conductorId,
    required super.conductorName,
    required super.conductorPhone,
    required super.vehicule,
    required super.parkingId,
    required super.parkingAddress,
    required super.place,
    required super.date,
    required super.startTime,
    required super.endTime,
    required super.status,
  });

  ReservationModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    id: doc.id,
    conductorId: doc['conductor_id'] as String,
    conductorName: doc['conductor_name'] as String,
    conductorPhone: doc['conductor_phone'] as String,
    vehicule: VehiculeModel.fromJson(doc['vehicule'] as Map<String, dynamic>),
    parkingId: doc['parking_id'] as String,
    parkingAddress: doc['parking_address'] as String,
    place: PlaceModel.fromJson(doc['place']),
    date: doc['date'] as String,
    startTime: doc['start_time'] as String,
    endTime: doc['end_time'] as String,
    status: $enumDecode(_$ReservationStatusEnumMap, doc['status']),
  );

  ReservationModel.empty() : this(
    id: '',
    conductorId: '',
    conductorName: '',
    conductorPhone: '',
    vehicule: const VehiculeModel.empty(),
    parkingId: '',
    parkingAddress: '',
    place: PlaceModel.empty(),
    date: '',
    startTime: '',
    endTime: '' ,
    status: ReservationStatus.pending,
  );

  ReservationModel copyWith({
    String? date,
    String? startTime,
    String? endTime,
    ReservationStatus? status,
  }) => ReservationModel(
    id: id,
    conductorId: conductorId,
    conductorName: conductorName,
    conductorPhone: conductorPhone,
    vehicule: vehicule,
    parkingId: parkingId,
    parkingAddress: parkingAddress,
    date: date ?? this.date,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    status: status ?? this.status, 
    place: place
);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}