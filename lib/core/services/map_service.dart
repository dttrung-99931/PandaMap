import 'dart:developer';

import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapService {
  MapService._();
  static MapService? _instance;
  factory MapService() {
    return _instance ??= MapService._();
  }

  final location.Location _location = location.Location();
  Stream<LocationData> get onLocationChanged => _location.onLocationChanged;

  Future<MapLocation?> getCurrentLocation() async {
    bool locationServiceEnabled = await _location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await _location.requestService();
      if (!locationServiceEnabled) {
        log('Error location service');
        return null;
      }
    }

    bool locationPermissionGranted =
        await _location.hasPermission() == PermissionStatus.granted;
    if (!locationPermissionGranted) {
      locationPermissionGranted =
          await _location.requestPermission() == PermissionStatus.granted;

      if (!locationPermissionGranted) {
        log('Error location service');
        return null;
      }
    }

    LocationData locationData = await _location.getLocation();
    return MapLocation.fromLocationData(locationData);
  }
}
