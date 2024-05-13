import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panda_map/map/models/location_model.dart';
import 'package:panda_map/map/services/map_service.dart';

class MapController extends ChangeNotifier {
  final MapService _mapService = MapService();
  final Set<Marker> markers = <Marker>{};
  final Set<Circle> circles = <Circle>{};
  Completer<GoogleMapController> _controllerCompleter = Completer();
  Future<GoogleMapController> get controllerFuture =>
      _controllerCompleter.future;
  int _currentMapTypeIndex = 1;
  int get currentMapTypeIndex => _currentMapTypeIndex;
  MapType get mapType => MapType.values[currentMapTypeIndex];

  void changeMapType() {
    _currentMapTypeIndex++;
    if (currentMapTypeIndex == MapType.values.length) {
      _currentMapTypeIndex = 0;
    }
    notifyListeners();
  }

  void addMarker(LatLng latlng) {
    Marker marker =
        Marker(markerId: MarkerId(latlng.toString()), position: latlng);
    markers.add(marker);
    notifyListeners();
  }

  void addRandomCircle(LatLng latlng) {
    Circle circle = Circle(
        circleId: CircleId(latlng.toString()),
        fillColor: Colors.purple[100 * (1 + math.Random().nextInt(8))]!,
        center: latlng,
        strokeWidth: 0,
        radius: 20.toDouble() * (1 + math.Random().nextInt(8)));

    circles.add(circle);
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    // onMapCreated may be called many times by MapScreen due to back to home screen
    if (_controllerCompleter.isCompleted) {
      _controllerCompleter = Completer();
    }
    _controllerCompleter.complete(controller);
    focusCurrentLocation(animate: false);
    notifyListeners();
  }

  Future<void> focusCurrentLocation({bool animate = true}) async {
    LocationModel? location = await _mapService.getCurrentLocation();
    if (location != null) {
      focusMapTo(location);
    } else {
      log('Google map: FInd location failed');
    }
  }

  Future<void> focusMapTo(LocationModel location, {bool animate = true}) async {
    return control((GoogleMapController controller) {
      CameraUpdate cameraUpdate = CameraUpdate.newLatLng(location.latLng);
      if (animate) {
        controller.animateCamera(cameraUpdate);
      } else {
        controller.moveCamera(cameraUpdate);
      }
    });
  }

  Future<void> control(Function(GoogleMapController controller) action) async {
    GoogleMapController controller = await controllerFuture;
    action(controller);
  }
}
