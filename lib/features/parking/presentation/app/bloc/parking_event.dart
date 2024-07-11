part of 'parking_bloc.dart';

sealed class ParkingEvent extends Equatable {
  const ParkingEvent();

  @override
  List<Object> get props => [];
}

class AddParkingEvent extends ParkingEvent {
  const AddParkingEvent({
    required this.parking
  });

  final ParkingEntity parking;

  @override
  List<Object> get props => [parking];
}

class GetAllParkingsEvent extends ParkingEvent {}

class SelectImageFromGalleryEvent extends ParkingEvent {}

class UploadParkingImageEvent extends ParkingEvent {
  const UploadParkingImageEvent({
    required this.parkingId,
    required this.file
  });

  final String parkingId;
  final XFile file;

  @override
  List<Object> get props => [parkingId, file];
}

class GetParkingImagesEvent extends ParkingEvent {
  const GetParkingImagesEvent({
    required this.parkingId
  });

  final String parkingId;

  @override
  List<Object> get props => [parkingId];
}

class GetParkingEvent extends ParkingEvent {
  const GetParkingEvent({
    required this.parkingId
  });

  final String parkingId;

  @override
  List<Object> get props => [parkingId];
}

class GetPlacesByParkingEvent extends ParkingEvent {
  const GetPlacesByParkingEvent({ required this.parkingId });

  final String parkingId;

  @override
  List<Object> get props => [parkingId];
}

class AddPlaceEvent extends ParkingEvent {
  const AddPlaceEvent({
    required this.parkingId,
    required this.place
  });

  final String parkingId;
  final PlaceEntity place;

  @override
  List<Object> get props => [parkingId, place];
}

class UpdatePlaceEvent extends ParkingEvent {
  const UpdatePlaceEvent({
    required this.parkingId, 
    required this.place
  });

  final String parkingId;
  final PlaceEntity place;

  @override
  List<Object> get props => [parkingId, place];
}

class DeletePlaceEvent extends ParkingEvent {
  const DeletePlaceEvent({
    required this.parkingId, 
    required this.place
  });

  final String parkingId;
  final PlaceEntity place;

  @override
  List<Object> get props => [parkingId, place];
}