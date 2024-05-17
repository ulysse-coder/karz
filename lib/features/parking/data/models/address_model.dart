
import 'package:json_annotation/json_annotation.dart';
import 'package:ulysse_app/features/parking/domain/entities/address_entity.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends AddressEntity {
  const AddressModel({
    required super.latitude,
    required super.longitude,
    required super.fullAddress
  });

  AddressModel.empty() : this(
    latitude: 0.0,
    longitude: 0.0,
    fullAddress: ''
  );

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}