import 'dart:developer';
import 'dart:math' as math;

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

  /// Return distance from this location to [other] location
  /// Distance is calculated based 2-d coordinate system with latitude is x and longitue is y
  double cooordinatorDistanceTo(MapLocation other) {
    final distance = math.sqrt((lat - other.lat) * (lat - other.lat) +
        (long - other.long) * (long - other.long));
    log(distance.toString());
    return distance;
  }
}
