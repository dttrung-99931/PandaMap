import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_lat_lng.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/services/map_service.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

import 'loading_handle_mixin.dart';

abstract class PandaMapController extends ChangeNotifier
    with LoadingHandleMixin, DisposableMixin {
  PandaMapController();

  MapLocation hcmCityCoordimate =
      MapLocation(lat: 10.816678822832658, long: 106.71402198972446);

  late final MapService mapService = MapService();

  @override
  void dispose() {
    disposeAllSubscriptions();
    super.dispose();
  }

  void onLocationChanged(LocationData event);

  /// Init
  @mustCallSuper
  Future<void> init(MapOptions options) async {
    initMap(options);
    addSubscription(mapService.onLocationChanged.listen(onLocationChanged));
  }

  /// Init specify map
  /// Overrided by PandaMapController impl
  @mustCallSuper
  @protected
  Future<void> initMap(MapOptions options);

  void changeMapType();

  void addMarker(MapLatLng latlng);

  void addRandomCircle(MapLatLng latlng);

  /// Focus current location `currentLcoation` and move current lcoation indicator
  /// If `currentLcoation` is null then handling to find out current location
  Future<void> focusCurrentLocation({
    MapCurrentLocation? currentLocation,
    bool animate = true,
  });

  Future<void> focusLocation(MapLocation location, {bool animate = true});
}
