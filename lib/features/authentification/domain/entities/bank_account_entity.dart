
import 'package:equatable/equatable.dart';

class BankAccountEntity extends Equatable {
  const BankAccountEntity({
    required this.ownerName,
    required this.card14Digits,
    required this.cvc,
    required this.expirationDate
  });

  final String ownerName;
  final String card14Digits;
  final String cvc;
  final String expirationDate;

  @override
  List<Object?> get props => [ownerName, card14Digits, cvc, expirationDate];
}