
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

part 'security_model.g.dart';

@JsonSerializable()
class SecurityModel extends UserModel {
  const SecurityModel({
    required super.uid,
    required super.name,
    required super.phone,
    required super.role,
    required this.workDuration,
    required this.startAt,
    required this.endAt
  });

  SecurityModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    phone: doc['phone'],
    role: UserRole.gardien,
    workDuration: doc['workDuration'],
    startAt: doc['startAt'],
    endAt: doc['endAt'],
  );

  factory SecurityModel.fromJson(Map<String, dynamic> json) => _$SecurityModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecurityModelToJson(this);

  SecurityModel.empty() : this(
    uid: '',
    name: '',
    phone: '',
    role: UserRole.gardien,
    workDuration: 2,
    startAt: DateTime.now(),
    endAt: DateTime.now()
  );

  final int workDuration;
  final DateTime startAt;
  final DateTime endAt;
}