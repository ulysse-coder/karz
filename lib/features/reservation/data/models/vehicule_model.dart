
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/reservation/domain/entities/vehicule_entity.dart';

part 'vehicule_model.g.dart';

@JsonSerializable()
class VehiculeModel extends VehiculeEntity {
  const VehiculeModel({
    required super.matricule,
    required super.type
  });

  const VehiculeModel.empty() : this(
    matricule: '',
    type: VehiculeType.defaultType
  );

  VehiculeModel copyWith({
    String? matricule,
    VehiculeType? type
  }) => VehiculeModel(
    matricule: matricule ?? this.matricule, 
    type: type ?? this.type
  );

  factory VehiculeModel.fromJson(Map<String, dynamic> json) => _$VehiculeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehiculeModelToJson(this);
}