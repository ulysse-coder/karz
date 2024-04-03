// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'photo': instance.photo,
    };

const _$UserRoleEnumMap = {
  UserRole.conducteur: 'conducteur',
  UserRole.gardien: 'gardien',
  UserRole.defaultRole: 'defaultRole',
};
