part of 'parking_bloc.dart';

sealed class ParkingState extends Equatable {
  const ParkingState();
  
  @override
  List<Object> get props => [];
}

final class ParkingInitial extends ParkingState {}

final class ParkingAddedState extends ParkingState {}

final class ParkingLoadingState extends ParkingState {}

final class ParkingLoadedState extends ParkingState {
  const ParkingLoadedState({
    required this.parking
  });

  final ParkingEntity parking;

  @override
  List<Object> get props => [parking];
}

final class ParkingImagesLoadedState extends ParkingState {
  const ParkingImagesLoadedState({
    required this.images
  });

  final List<File> images;

  @override
  List<Object> get props => [images];
}

final class ParkingImagesUploadedState extends ParkingState {}