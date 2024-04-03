import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/usecases/add_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking_images.dart';
import 'package:ulysse_app/features/parking/domain/usecases/upload_parking_image.dart';

part 'parking_event.dart';
part 'parking_state.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingState> {
  ParkingBloc({
    required AddParking addParking,
    required UploadParkingImage uploadParkingImage,
    required GetParking getParking,
    required GetParkingImages getParkingImages
  }) : 
  
  _addParking = addParking,
  _uploadParkingImage = uploadParkingImage,
  _getParking = getParking,
  _getParkingImages = getParkingImages,
  super(ParkingInitial()) {
    on<AddParkingEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _addParking(event.parking);

      result.fold(
        (l) => null, 
        (_) => emit(ParkingAddedState())
      );
    });
    on<UploadParkingImageEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _uploadParkingImage(event.image);

      result.fold(
        (l) => null, 
        (_) => emit(ParkingImagesUploadedState())
      );
    });
    on<GetParkingImagesEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _getParkingImages(event.parkingId);

      result.fold(
        (l) => null, 
        (images) => emit(ParkingImagesLoadedState(images: images))
      );
    });
    on<GetParkingEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _getParking(event.parkingId);

      result.fold(
        (l) => null, 
        (parking) => emit(ParkingLoadedState(parking: parking))
      );
    });
  }

  final AddParking _addParking;
  final UploadParkingImage _uploadParkingImage;
  final GetParking _getParking;
  final GetParkingImages _getParkingImages;
}
