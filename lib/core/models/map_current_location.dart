import 'package:geolocator/geolocator.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapCurrentLocation extends MapLocation {
  MapCurrentLocation({
    required super.lat,
    required super.long,
    required this.bearingDegrees,
  });
  final double bearingDegrees;

  factory MapCurrentLocation.fromPosition(Position pos) {
    return MapCurrentLocation(
      lat: pos.latitude,
      long: pos.longitude,
      bearingDegrees: pos.heading,
    );
  }
}
