import 'package:location_platform_interface/location_platform_interface.dart';
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

  static MapLocation fromLocationData(LocationData locationData) {
    return MapLocation(
        lat: locationData.latitude!, long: locationData.longitude!);
  }

  static MapLocation fromSearchLocation(MapSearchResultDto locationData) {
    return MapLocation(lat: 100, long: 100);
  }
}
