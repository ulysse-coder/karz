
import 'package:equatable/equatable.dart';
import 'package:karz/core/utilities/enum.dart';

class VehiculeEntity extends Equatable {
  const VehiculeEntity({
    required this.matricule,
    required this.type
  });

  final String matricule;
  final VehiculeType type;

  @override
  List<Object?> get props => [matricule, type];
}