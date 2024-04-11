// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationModel _$EvaluationModelFromJson(Map<String, dynamic> json) =>
    EvaluationModel(
      id: json['id'] as String,
      rate: (json['rate'] as num).toDouble(),
      comment: json['comment'] as String,
      impressions: (json['impressions'] as List<dynamic>)
          .map((e) => $enumDecodeNullable(_$ImpressionsEnumMap, e))
          .toList(),
      conductorId: json['conductorId'] as String,
      parkingId: json['parkingId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$EvaluationModelToJson(EvaluationModel instance) =>
    <String, dynamic>{
      // 'id': instance.id,
      'rate': instance.rate,
      'comment': instance.comment,
      'impressions':
          instance.impressions.map((e) => _$ImpressionsEnumMap[e]).toList(),
      'conductorId': instance.conductorId,
      'parkingId': instance.parkingId,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ImpressionsEnumMap = {
  Impressions.clean: 'clean',
  Impressions.welcoming: 'welcoming',
  Impressions.safety: 'safety',
  Impressions.qualityPriceRatio: 'qualityPriceRatio',
};
