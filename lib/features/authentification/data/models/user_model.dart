
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.phone,
    required super.role,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    phone: doc['phone'],
    role: _$UserRoleEnumMap.keys.toList()[_$UserRoleEnumMap.values.toList().indexOf(doc['role'])],
  );

  const UserModel.empty() : this(
    uid: '',
    name: '',
    phone: '',
    role: UserRole.defaultRole,
  );

  UserModel copyWith({
    String? name,
    String? phone,
    UserRole? role,
  }) => UserModel(
    uid: uid, 
    name: name ?? this.name, 
    phone: phone ?? this.phone,
    role: role ?? this.role,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}