
import 'package:equatable/equatable.dart';
import 'package:karz/core/utilities/enum.dart';

class PlaceEntity extends Equatable {
  const PlaceEntity({
    required this.id,
    required this.name,
    required this.status
  });

  final String id;
  final String name;
  final PlaceStatus status;

  @override
  List<Object?> get props => [id, name, status];
}