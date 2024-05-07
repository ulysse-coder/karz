// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    BankAccountModel(
      ownerName: json['owner_name'] as String,
      card14Digits: json['card_14_digits'] as String,
      cvc: json['cvc'] as String,
      expirationDate: json['expiration_date'] as String,
    );

Map<String, dynamic> _$BankAccountModelToJson(BankAccountModel instance) =>
    <String, dynamic>{
      'owner_name': instance.ownerName,
      'card_14_digits': instance.card14Digits,
      'cvc': instance.cvc,
      'expiration_date': instance.expirationDate,
    };
