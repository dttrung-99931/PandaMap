import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:panda_map/core/models/map_current_location.dart';

class MapService {
  MapService._() {
    Geolocator.getPositionStream().listen(
      (Position position) {
        _locationChangedController
            .add(MapCurrentLocation.fromPosition(position));
      },
    );
  }
  factory MapService() {
    return _instance ??= MapService._();
  }
  static MapService? _instance;

  Stream<MapCurrentLocation> get onLocationChanged {
    return _locationChangedController.stream;
  }

  final _locationChangedController =
      StreamController<MapCurrentLocation>.broadcast();

  Future<MapCurrentLocation?> getCurrentLocation() async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await Geolocator.openLocationSettings();
      if (!locationServiceEnabled) {
        log('Error location service');
        return null;
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
        return null;
      }
    }

    Position locationData = await Geolocator.getCurrentPosition();
    return MapCurrentLocation.fromPosition(locationData);
  }

  bool _isLocationPermissionEnabled(LocationPermission permission) {
    return [LocationPermission.always, LocationPermission.whileInUse]
        .contains(permission);
  }
}
