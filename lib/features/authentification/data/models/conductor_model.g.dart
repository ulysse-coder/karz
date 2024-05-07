// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conductor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConductorModel _$ConductorModelFromJson(Map<String, dynamic> json) =>
    ConductorModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      bankAccounts: (json['bank_accounts'] as List<dynamic>)
          .map((e) => BankAccountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConductorModelToJson(ConductorModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'bank_accounts': instance.bankAccounts.map((e) => e.toJson()).toList(),
    };

const _$UserRoleEnumMap = {
  UserRole.conducteur: 'conducteur',
  UserRole.gardien: 'gardien',
  UserRole.defaultRole: 'defaultRole',
};
