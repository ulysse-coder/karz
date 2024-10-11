
import 'package:equatable/equatable.dart';
import 'package:karz/features/authentification/data/models/bank_account_model.dart';

class ConductorEntity extends Equatable {
  const ConductorEntity({
    required this.uid,
    required this.name,
    required this.phone,
    required this.bankAccounts
  });

  final String uid;
  final String name;
  final String phone;
  final List<BankAccountModel> bankAccounts;

  @override
  List<Object?> get props => [uid, name, phone, bankAccounts];

}