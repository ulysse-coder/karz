
import 'package:get/get.dart';
import 'package:karz/features/parking/data/models/parking_model.dart';
import 'package:karz/features/parking/data/models/place_model.dart';

class ParkingController extends GetxController {
  final _parkings = <ParkingModel>[].obs;
  final _currentParking = ParkingModel.empty().obs ;
  final _places = <PlaceModel>[].obs;
  final _currentPlace = PlaceModel.empty().obs;

  ParkingModel get currentParking => _currentParking.value;
  List<ParkingModel> get parkings => _parkings;
  List<PlaceModel> get places => _places;
  PlaceModel get currentPlace => _currentPlace.value;

  set currentParking(ParkingModel value) => _currentParking.value = value;
  set parkings(List<ParkingModel> value) => _parkings.value = value;
  set places(List<PlaceModel> value) => _places.value = value;
  set currentPlace(PlaceModel value) => _currentPlace.value = value;
  
}