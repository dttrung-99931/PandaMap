import 'dart:developer';

import 'package:location/location.dart';
import 'package:panda_map/map/models/location_model.dart';

class MapService {
  MapService._();
  static MapService? _instance;
  factory MapService() {
    return _instance ??= MapService._();
  }
  
  final Location _location = Location();

  Future<LocationModel?> getCurrentLocation() async {
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
    return LocationModel.fromLocationData(locationData);
  }
}
