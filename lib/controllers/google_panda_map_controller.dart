import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panda_map/core/models/map_lat_lng.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/services/map_service.dart';

// Controler [GoogleMap]
class GooglePandaMapController extends PandaMapController {
  GooglePandaMapController({MapService? service}) : _mapService = service ?? MapService();

  final MapService _mapService;
  final Set<Marker> markers = <Marker>{};
  final Set<Circle> circles = <Circle>{};
  Completer<GoogleMapController> _controllerCompleter = Completer();
  Future<GoogleMapController> get controllerFuture => _controllerCompleter.future;
  int _currentMapTypeIndex = 1;
  int get currentMapTypeIndex => _currentMapTypeIndex;
  MapType get mapType => MapType.values[currentMapTypeIndex];

  @override
  void changeMapType() {
    _currentMapTypeIndex++;
    if (currentMapTypeIndex == MapType.values.length) {
      _currentMapTypeIndex = 0;
    }
    notifyListeners();
  }

  @override
  void addMarker(MapLatLng latlng) {
    Marker marker = Marker(markerId: MarkerId(latlng.toString()), position: latlng.toGoogleLatLng());
    markers.add(marker);
    notifyListeners();
  }

  @override
  void addRandomCircle(MapLatLng latlng) {
    Circle circle = Circle(
        circleId: CircleId(latlng.toString()),
        fillColor: Colors.purple[100 * (1 + math.Random().nextInt(8))]!,
        center: latlng.toGoogleLatLng(),
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

  @override
  Future<void> focusCurrentLocation({bool animate = true}) async {
    MapLocation? location = await _mapService.getCurrentLocation();
    if (location != null) {
      focusMapTo(location);
    } else {
      log('Google map: FInd location failed');
    }
  }

  @override
  Future<void> focusMapTo(MapLocation location, {bool animate = true}) async {
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

extension ToGoogleLatLng on MapLatLng {
  LatLng toGoogleLatLng(){
    return LatLng(lat, lng);
  }
}

extension ToMapLatLng on LatLng {
  MapLatLng toMapLatLng(){
    return MapLatLng(lat: latitude, lng: longitude);
  }
}