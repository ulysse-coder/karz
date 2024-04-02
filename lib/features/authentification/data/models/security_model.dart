
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
    required super.role,
    required super.photo,
    required this.workDuration,
    required this.startAt,
    required this.endAt
  });

  SecurityModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    role: doc['role'],
    photo: doc['photo'],
    workDuration: doc['workDuration'],
    startAt: doc['startAt'],
    endAt: doc['endAt'],
  );

  factory SecurityModel.fromJson(Map<String, dynamic> json) => _$SecurityModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecurityModelToJson(this);

  final int workDuration;
  final DateTime startAt;
  final DateTime endAt;
}