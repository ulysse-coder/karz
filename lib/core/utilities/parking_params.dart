
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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