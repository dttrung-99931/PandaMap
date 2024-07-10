import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:panda_map/core/models/map_current_location.dart';

class MapService {
  MapService._();

  factory MapService() {
    return _instance ??= MapService._();
  }
  static MapService? _instance;

  Stream<MapCurrentLocation> get onLocationChanged {
    return _locationChangedController.stream;
  }

  final _locationChangedController =
      StreamController<MapCurrentLocation>.broadcast();

  Future<void> init() async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await Geolocator.openLocationSettings();
      if (!locationServiceEnabled) {
        log('Error location service');
        return;
      }
    }

    bool locationPermissionGranted = _isLocationPermissionEnabled(
      await Geolocator.checkPermission(),
    );
    if (!locationPermissionGranted) {
      locationPermissionGranted = _isLocationPermissionEnabled(
        await Geolocator.requestPermission(),
      );
      if (!locationPermissionGranted) {
        log('Error location service');
        return;
      }
    }

    Geolocator.getPositionStream().listen(
      (Position position) {
        _locationChangedController
            .add(MapCurrentLocation.fromPosition(position));
      },
    );
  }

  Future<MapCurrentLocation?> getCurrentLocation() async {
    Position locationData = await Geolocator.getCurrentPosition();
    return MapCurrentLocation.fromPosition(locationData);
  }

  bool _isLocationPermissionEnabled(LocationPermission permission) {
    return [LocationPermission.always, LocationPermission.whileInUse]
        .contains(permission);
  }
}
