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

class UploadParkingImageEvent extends ParkingEvent {
  const UploadParkingImageEvent({
    required this.image
  });

  final File image;

  @override
  List<Object> get props => [image];
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