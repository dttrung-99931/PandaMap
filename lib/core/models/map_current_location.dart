import 'package:location/location.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapCurrentLocation extends MapLocation {
  MapCurrentLocation({
    required super.lat,
    required super.long,
    required this.bearingDegrees,
  });
  final double bearingDegrees;

  factory MapCurrentLocation.fromLocationData(LocationData locationData) {
    return MapCurrentLocation(
      lat: locationData.latitude!,
      long: locationData.longitude!,
      bearingDegrees: locationData.heading!,
    );
  }
}
