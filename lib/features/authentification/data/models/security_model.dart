
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/authentification/domain/entities/security_entity.dart';

part 'security_model.g.dart';

@JsonSerializable()
class SecurityModel extends SecurityEntity {
  const SecurityModel({
    required super.uid,
    required super.name,
    required super.phone,
    required super.role,
  });

  SecurityModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    phone: doc['phone'],
    role: UserRole.gardien,
  );

  factory SecurityModel.fromJson(Map<String, dynamic> json) => _$SecurityModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityModelToJson(this);

  const SecurityModel.empty() : this(
    uid: '',
    name: '',
    phone: '',
    role: UserRole.gardien,
  );

}