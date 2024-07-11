
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulysse_app/core/utilities/parking_params.dart';
import 'package:ulysse_app/features/parking/domain/entities/parking_entity.dart';
import 'package:ulysse_app/features/parking/domain/entities/place_entity.dart';
import 'package:ulysse_app/features/parking/domain/usecases/add_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/add_place.dart';
import 'package:ulysse_app/features/parking/domain/usecases/delete_place.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_all_parkings.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking_images.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_places_by_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/select_image_from_gallery.dart';
import 'package:ulysse_app/features/parking/domain/usecases/update_place.dart';
import 'package:ulysse_app/features/parking/domain/usecases/upload_parking_image.dart';

part 'parking_event.dart';
part 'parking_state.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingState> {
  ParkingBloc({
    required AddParking addParking,
    required SelectImageFromGallery selectImageFromGallery,
    required UploadParkingImage uploadParkingImage,
    required GetAllParkings getAllParkings,
    required GetParking getParking,
    required GetParkingImages getParkingImages,
    required GetPlacesByParking getPlacesByParking,
    required AddPlace addPlace,
    required UpdatePlace updatePlace,
    required DeletePlace deletePlace
  }) : 
  
  _addParking = addParking,
  _selectImageFromGallery = selectImageFromGallery,
  _uploadParkingImage = uploadParkingImage,
  _getParking = getParking,
  _getAllParkings = getAllParkings,
  _getParkingImages = getParkingImages,
  _getPlacesByParking = getPlacesByParking,
  _addPlace = addPlace,
  _updatePlace = updatePlace,
  _deletePlace = deletePlace,
  super(ParkingInitial()) {
    on<AddParkingEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _addParking(event.parking);

      result.fold(
        (l) => null, 
        (_) => emit(ParkingAddedState())
      );
    });
    on<SelectImageFromGalleryEvent>((event, emit) async {
      final result = await _selectImageFromGallery();

      result.fold((l) => null, (file) => emit(ImageSelectedState(file: file)));
    });
    on<UploadParkingImageEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _uploadParkingImage(UploadImageParams(
        parkingId: event.parkingId, 
        file: event.file, 
      ));

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
    on<GetAllParkingsEvent>((event, emit) async {
      emit(ParkingLoadingState());

      final result = await _getAllParkings();

      result.fold(
        (l) => null, 
        (parkings) => emit(AllParkingsLoaded(parkings: parkings))
      );
    });
    on<GetPlacesByParkingEvent>((event, emit) async {
      emit(PlaceLoadingState());

      final result = await _getPlacesByParking(event.parkingId);

      result.fold(
        (l) => null,
        (places) => emit(PlacesLoadedState(places: places))
      );

    });
    on<AddPlaceEvent>((event, emit) async {
      final result = await _addPlace(PlaceCRUDParams(parkingId: event.parkingId, place: event.place));

      result.fold(
        (l) => null,
        (r) => emit(CRUDOPerationDoneSuccesfully())
      );
    });
    on<UpdatePlaceEvent>((event, emit) async {
      emit(PlaceLoadingState());

      final result = await _updatePlace(PlaceCRUDParams(
        parkingId: event.parkingId, 
        place: event.place
      ));

      result.fold(
        (l) => null,
        (r) => emit(CRUDOPerationDoneSuccesfully())
      );
    });
    on<DeletePlaceEvent>((event, emit) async {
      emit(PlaceLoadingState());

      final result = await _deletePlace(PlaceCRUDParams(
        parkingId: event.parkingId, 
        place: event.place
      ));

      result.fold(
        (l) => null,
        (r) => emit(CRUDOPerationDoneSuccesfully())
      );
    });
  }

  // @override
  // Stream<ParkingState> mapEventToState(ParkingEvent event) async* {
  //   if (event is GetPlacesByParkingEvent) {
  //     yield ParkingLoadingState();

  //     final result = await _getPlacesByParking(event.parkingId);

  //     result.fold(
  //       (l) => null, 
  //       (places) async* {
  //         yield PlacesLoadedState(places: places);
  //       }
  //     );
  //   }
  //   else if (event is GetParkingImagesEvent) {
  //     yield ParkingLoadingState();

  //     final result = await _getParkingImages(event.parkingId);

  //     result.fold(
  //       (l) => null, 
  //       (images) async* {
  //         yield ParkingImagesLoadedState(images: images);
  //       });
  //   }
  // }

  final AddParking _addParking;
  final SelectImageFromGallery _selectImageFromGallery;
  final UploadParkingImage _uploadParkingImage;
  final GetAllParkings _getAllParkings;
  final GetParking _getParking;
  final GetParkingImages _getParkingImages;
  final GetPlacesByParking _getPlacesByParking;
  final AddPlace _addPlace;
  final UpdatePlace _updatePlace;
  final DeletePlace _deletePlace;
}
