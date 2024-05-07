
import 'package:get/get.dart';
import 'package:ulysse_app/features/parking/data/models/parking_model.dart';

class ParkingController extends GetxController {
  final _parkings = <ParkingModel>[].obs;
  final _currentParking = ParkingModel.empty().obs ;

  ParkingModel get currentParking => _currentParking.value;
  List<ParkingModel> get parkings => _parkings;

  set currentParking(ParkingModel value) => _currentParking.value = value;
  set parkings(List<ParkingModel> value) => _parkings.value = value;
}