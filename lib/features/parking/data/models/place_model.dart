
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/parking/domain/entities/place_entity.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel extends PlaceEntity {
  const PlaceModel({
    required super.id,
    required super.name,
    required super.status,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);

  factory PlaceModel.empty() => const PlaceModel(id: '', name: '', status: PlaceStatus.free);
}