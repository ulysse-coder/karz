// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    BankAccountModel(
      ownerName: json['ownerName'] as String,
      card14Digits: json['card14Digits'] as String,
      cvc: json['cvc'] as String,
      expirationDate: json['expirationDate'] as String,
    );

Map<String, dynamic> _$BankAccountModelToJson(BankAccountModel instance) =>
    <String, dynamic>{
      'ownerName': instance.ownerName,
      'card14Digits': instance.card14Digits,
      'cvc': instance.cvc,
      'expirationDate': instance.expirationDate,
    };
