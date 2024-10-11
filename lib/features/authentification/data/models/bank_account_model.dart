
import 'package:json_annotation/json_annotation.dart';
import 'package:karz/features/authentification/domain/entities/bank_account_entity.dart';

part 'bank_account_model.g.dart';

@JsonSerializable()
class BankAccountModel extends BankAccountEntity {
  const BankAccountModel({
    required super.ownerName,
    required super.card14Digits,
    required super.cvc,
    required super.expirationDate
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) => _$BankAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$BankAccountModelToJson(this);
}