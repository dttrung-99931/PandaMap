import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class MapLocation {
  MapLocation({
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;

  LatLng get latLng => LatLng(lat, long);

  static MapLocation fromLocationData(LocationData locationData) {
    return MapLocation(lat: locationData.latitude!, long: locationData.longitude!);
  }

  static MapLocation fromSearchLocation(Location locationData) {
    return MapLocation(lat: locationData.lat!, long: locationData.lng!);
  }
}
