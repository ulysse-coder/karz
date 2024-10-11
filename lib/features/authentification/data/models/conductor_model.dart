
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:karz/features/authentification/data/models/bank_account_model.dart';
import 'package:karz/features/authentification/domain/entities/conductor_entity.dart';

part 'conductor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConductorModel extends ConductorEntity {
  const ConductorModel({
    required super.uid,
    required super.name,
    required super.phone,
    required super.bankAccounts
  });

  ConductorModel.fromDocumentSnapshot(DocumentSnapshot doc) : this(
    uid: doc.id,
    name: doc['name'],
    phone: doc['phone'],
    bankAccounts: (doc['banck_accounts'] as List<dynamic>)
      .map((bank) => BankAccountModel.fromJson(bank as Map<String, dynamic>))
      .toList()
  );

  ConductorModel.empty() : this(
    uid: '',
    name: '',
    phone: '',
    bankAccounts: <BankAccountModel>[]
  );

  ConductorModel copyWith({
    String? name,
    String? phone,
    List<BankAccountModel>? bankAccounts
  }) => ConductorModel(
    uid: uid, 
    name: name ?? this.name, 
    phone: phone ?? this.phone,
    bankAccounts: bankAccounts ?? this.bankAccounts, 
  );

  factory ConductorModel.fromJson(Map<String, dynamic> json) => _$ConductorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConductorModelToJson(this);
}