import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_lat_lng.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/services/map_service.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart' as panda_map;

// Controler [GoogleMap]
class MapBoxController extends PandaMapController {
  MapBoxController({MapService? service})
      : _mapService = service ?? MapService();

  final MapService _mapService;
  // final Set<Marker> markers = <Marker>{};
  // final Set<Circle> circles = <Circle>{};
  Completer<MapboxMap> _controllerCompleter = Completer();
  Future<MapboxMap> get controllerFuture =>
      _controllerCompleter.future;
  int _currentMapTypeIndex = 1;
  int get currentMapTypeIndex => _currentMapTypeIndex;
  // MapType get mapType => MapType.values[currentMapTypeIndex];

  @override
  void changeMapType() {
    // _currentMapTypeIndex++;
    // if (currentMapTypeIndex == MapType.values.length) {
    //   _currentMapTypeIndex = 0;
    // }
    notifyListeners();
  }

  @override
  void addMarker(MapLatLng latlng) {
    // Marker marker = Marker(
    //     markerId: MarkerId(latlng.toString()),
    //     position: latlng.toGoogleLatLng(),);
    // markers.add(marker);
    notifyListeners();
  }

  @override
  void addRandomCircle(MapLatLng latlng) {
    // Circle circle = Circle(
    //     circleId: CircleId(latlng.toString()),
    //     fillColor: Colors.purple[100 * (1 + math.Random().nextInt(8))]!,
    //     center: latlng.toGoogleLatLng(),
    //     strokeWidth: 0,
    //     radius: 20.toDouble() * (1 + math.Random().nextInt(8)));

    // circles.add(circle);
    notifyListeners();
  }

  void onMapCreated(MapboxMap controller) {
    // onMapCreated may be called many times by MapScreen due to back to home screen
    if (_controllerCompleter.isCompleted) {
      _controllerCompleter = Completer();
    }
    _controllerCompleter.complete(controller);
    focusCurrentLocation(animate: false);
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
    return control((MapboxMap controller) {
      controller.flyTo(CameraOptions(
        center: {
          'latitude': location.lat,
          'longitude': location.long,
        },
      ), MapAnimationOptions(
        duration: animate ? 300 : 0
      ));
    });
  }

  Future<void> control(Function(MapboxMap controller) action) async {
    MapboxMap controller = await controllerFuture;
    action(controller);
  }

  @override
  Future<void> init(panda_map.MapOptions options) async {
    MapboxOptions.setAccessToken(PandaMap.options.mapAPIKey);
  }
}

// extension ToGoogleLatLng on MapLatLng {
//   LatLng toGoogleLatLng() {
//     return LatLng(lat, lng);
//   }
// }

// extension ToMapLatLng on LatLng {
//   MapLatLng toMapLatLng() {
//     return MapLatLng(lat: latitude, lng: longitude);
//   }
// }
