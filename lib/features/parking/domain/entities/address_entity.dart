
import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  const AddressEntity({
    required this.latitude,
    required this.longitude,
    required this.fullAddress
  });

  final double latitude;
  final double longitude;
  final String fullAddress;

  @override
  List<Object?> get props => [latitude, longitude, fullAddress];
}