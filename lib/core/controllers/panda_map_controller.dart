import 'dart:async';

import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_lat_lng.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/panda_map_options.dart';

import 'loading_handle_mixin.dart';

abstract class PandaMapController extends ChangeNotifier with LoadingHandleMixin {
  Future<void> init(MapOptions options);
  
  void changeMapType();

  void addMarker(MapLatLng latlng);

  void addRandomCircle(MapLatLng latlng);

  Future<void> focusCurrentLocation({bool animate = true});

  Future<void> focusMapTo(MapLocation location, {bool animate = true}) ;
}
