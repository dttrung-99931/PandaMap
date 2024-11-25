// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:panda_map/core/controllers/loading_handle_mixin.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_current_location_style.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/utils/constants.dart';

class MapTrackingOptions {
  final MapLocation from;
  final MapLocation to;

  MapTrackingOptions({
    required this.from,
    required this.to,
  });
}

class MapTrackingController extends ChangeNotifier with LoadingHandleMixin {
  MapTrackingController({
    PandaRoutingController? routingController,
    PandaMapController? mapController,
  })  : routingController = routingController ?? PandaMap.routingController,
        mapController = mapController ?? PandaMap.controller;

  final PandaRoutingController routingController;
  final PandaMapController mapController;
  PandaMapError? get error => _error;
  PandaMapError? _error;

  final StreamController<MapCurrentLocation> _currentLocationStream =
      StreamController.broadcast();

  late Stream<MapCurrentLocation> _prevLocaChangedStream;

  Future<void> startTracking(MapTrackingOptions options) async {
    await load(() async {
      await _initRoute(options);
    });
  }

  void stopTracking() {
    /// Revert current location stream when nav stopped
    mapController.locationChangedStream = _prevLocaChangedStream;
    routingController.navigatingLocationStyle =
        MapCurrentLocationStyle.navigation;
  }

  Future<void> _initRoute(MapTrackingOptions options) async {
    MapRoute? route;
    try {
      route = await routingController.findRoute(
        start: options.from,
        dest: options.to,
      );
    } catch (e) {
      log('Finding route error $e');
      _error = PandaMapError.errorFindingRoute;
    }

    if (route != null) {
      await routingController.showRoute(route);
      await Future.delayed(const Duration(milliseconds: 1200));

      /// Change map's current location stream to [_currentLocationStream]
      /// So that current location will be updated via
      /// _currentLocationStream (updateCurrentLocation) instead of GPS
      _prevLocaChangedStream = mapController.locationChangedStream;
      mapController.locationChangedStream = _currentLocationStream.stream;
      routingController.navigatingLocationStyle =
          MapCurrentLocationStyle.tracking;

      await routingController.startNavigation(route);
    } else {
      log('Route not found');
      _error = PandaMapError.routeNotFound;
    }
  }

  void updateCurrentLocation(MapCurrentLocation currentLocation) {
    _currentLocationStream.add(currentLocation);
  }
}
