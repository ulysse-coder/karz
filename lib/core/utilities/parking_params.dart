
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karz/features/parking/domain/entities/place_entity.dart';

class UploadImageParams extends Equatable {
  const UploadImageParams({
    required this.parkingId,
    required this.file
  });

  final String parkingId;
  final XFile file;

  @override
  List<Object?> get props => [parkingId, file];
}

class PlaceCRUDParams extends Equatable {
  const PlaceCRUDParams({
    required this.parkingId,
    required this.place
  });

  final String parkingId;
  final PlaceEntity place;

  @override
  List<Object?> get props => [parkingId, place];
}