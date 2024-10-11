
import 'package:json_annotation/json_annotation.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/evaluation/domain/entities/evaluation_entity.dart';

part 'evaluation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EvaluationModel extends EvaluationEntity {
  const EvaluationModel({
    required super.id,
    required super.rate,
    required super.comment,
    required super.impressions,
    required super.conductorId,
    required super.parkingId,
    required super.createdAt
  });

  Map<String, dynamic> toJson() => _$EvaluationModelToJson(this);
}