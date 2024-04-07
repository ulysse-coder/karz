
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

part 'conductor_model.g.dart';

@JsonSerializable()
class ConductorModel extends UserModel {
  const ConductorModel({
    required super.uid,
    required super.name,
    required super.phone,
    required super.role,
  });

  ConductorModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    phone: doc['phone'],
    role: doc['role'],
  );

  factory ConductorModel.fromJson(Map<String, dynamic> json) => _$ConductorModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConductorModelToJson(this);
}