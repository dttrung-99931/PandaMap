import 'dart:async';

import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_bounding_box.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_current_location_style.dart';
import 'package:panda_map/core/models/map_lat_lng.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_mode.dart';
import 'package:panda_map/core/models/map_polyline.dart';
import 'package:panda_map/core/services/map_service.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/utils/constants.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

import 'loading_handle_mixin.dart';

abstract class PandaMapController extends ChangeNotifier
    with LoadingHandleMixin, DisposableMixin {
  PandaMapController();

  MapLocation hcmCityCoordimate =
      MapLocation(lat: 10.816678822832658, long: 106.71402198972446);

  late final MapService mapService = MapService();

  final ValueNotifier<MapMode> mode = ValueNotifier(MapMode.normal);

  late Stream<MapCurrentLocation> locationChangedStream =
      mapService.onLocationChanged;

  void changeMode(MapMode mode) {
    this.mode.value = mode;
  }

  @override
  void dispose() {
    disposeAllSubscriptions();
    super.dispose();
  }

  void onLocationChanged(MapCurrentLocation location);

  /// Init
  @mustCallSuper
  Future<void> init(MapOptions options) async {
    initMap(options);
    addSubscription(locationChangedStream.listen(onLocationChanged));
  }

  /// Init specify map
  /// Overrided by PandaMapController impl
  @mustCallSuper
  @protected
  Future<void> initMap(MapOptions options);

  void changeMapType();

  void addMarker(MapLatLng latlng);

  void addRandomCircle(MapLatLng latlng);

  /// Add a polyline to map
  ///
  /// Return map polyline object that can be used for removing polyline latter
  Object addPolyline(MapPolylinePanda polyline);

  /// Remove a polyline from map
  /// [polyline] is returned from [addPolyline]
  void removePolyline(Object polyline);

  /// Focus current location `currentLcoation` and move current lcoation indicator
  /// If `currentLcoation` is null then handling to find out current location
  Future<void> focusCurrentLocation({
    MapCurrentLocation? currentLocation,
    bool animate = true,
  });

  Future<void> focusLocation(
    MapLocation location, {
    bool animate = true,
    Duration animationDuration = Constants.animationDuration,
    double bowFactor = 1,
  });

  void zoomIn();

  void zoomOut();

  /// Set zoom level to [zoomLevel]
  void zoom(double zoomLevel);

  void changeCurrentLocationStyle(MapCurrentLocationStyle style);

  void lookAtArea(MapBoundingBox area);

  void lookAtAreaInsideRectangle({
    required MapBoundingBox area,
    required Offset topLeftRect,
    required Size rectSize,
  });
}
