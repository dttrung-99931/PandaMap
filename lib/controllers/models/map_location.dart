import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:panda_map/services/dtos/search_result_dto.dart';

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

  static MapLocation fromSearchLocation(SearchResultDto locationData) {
    return MapLocation(lat: 100, long: 100);
  }
}
