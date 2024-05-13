import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class LocationModel {
  LocationModel({
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;

  LatLng get latLng => LatLng(lat, long);

  static LocationModel fromLocationData(LocationData locationData) {
    return LocationModel(
        lat: locationData.latitude!, long: locationData.longitude!);
  }
}
