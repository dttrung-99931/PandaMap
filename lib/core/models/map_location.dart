import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:panda_map/core/dtos/map_location_dto.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';

class MapLocation {
  MapLocation({
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;

  static MapLocation fromDto(MapLocationDto location) {
    return MapLocation(lat: location.latitude, long: location.longitude);
  }

  static MapLocation fromSearchLocation(MapSearchResultDto locationData) {
    return MapLocation(lat: 100, long: 100);
  }

  double distanceInMetters(MapLocation other) {
    double distance =
        Geolocator.distanceBetween(lat, long, other.lat, other.long);
    log(distance.toString());
    return distance;
  }
}
