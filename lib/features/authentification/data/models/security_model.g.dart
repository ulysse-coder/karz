// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityModel _$SecurityModelFromJson(Map<String, dynamic> json) =>
    SecurityModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      // workDuration: json['workDuration'] as int,
      // startAt: DateTime.parse(json['startAt'] as String),
      // endAt: DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$SecurityModelToJson(SecurityModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      // 'workDuration': instance.workDuration,
      // 'startAt': instance.startAt.toIso8601String(),
      // 'endAt': instance.endAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.conducteur: 'conducteur',
  UserRole.gardien: 'gardien',
  UserRole.defaultRole: 'defaultRole',
};
