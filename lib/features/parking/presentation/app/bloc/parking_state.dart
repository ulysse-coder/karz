part of 'parking_bloc.dart';

sealed class ParkingState extends Equatable {
  const ParkingState();
}

final class ParkingInitial extends ParkingState {
  @override
  List<Object?> get props => [];
}

final class ParkingAddedState extends ParkingState {
  @override
  List<Object?> get props => [];
}

final class ParkingLoadingState extends ParkingState {
  @override
  List<Object?> get props => [];
}

final class PlaceLoadingState extends ParkingState {
  @override
  List<Object?> get props => [];
}


final class ParkingLoadedState extends ParkingState {
  const ParkingLoadedState({
    required this.parking
  });

  final ParkingEntity parking;

  @override
  List<ParkingEntity> get props => [parking];
}

final class ImageSelectedState extends ParkingState {
  const ImageSelectedState({
    required this.file
  });

  final XFile? file;

  @override
  List<XFile?> get props => [file];
}

final class ParkingImagesLoadedState extends ParkingState {
  const ParkingImagesLoadedState({
    required this.images
  });

  final List<Reference>? images;

  @override
  List<Object?> get props => [images];
}

final class ParkingImagesUploadedState extends ParkingState {
  @override
  List<Object?> get props => [];
}

final class PlacesLoadedState extends ParkingState {
  const PlacesLoadedState({ required this.places });

  final List<PlaceEntity> places;

  @override
  List<Object?> get props => [places];
}

final class CRUDOPerationDoneSuccesfully extends ParkingState {
  @override
  List<Object?> get props => [];
}