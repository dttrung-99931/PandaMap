import 'package:flutter/foundation.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_move_step.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

enum PandaRoutingStatus {
  previewRoute,
  navigating,
  noRouting,
}

abstract class PandaRoutingController extends ChangeNotifier
    with DisposableMixin {
  bool get isNavigating => currentRoute != null;
  MapRoute? get currentRoute;
  int get remainingRouteLengthInMetter;
  MapRoute? get previewRoute;
  MapMoveStep get currentMoveStep;
  PandaRoutingStatus get status;
  Stream<MapCurrentLocation> get movingLocationStream;

  Future<void> init();
  Future<MapRoute?> findRoute({
    required MapLocation start,
    required MapLocation dest,
  });
  Future<void> showRoute(MapRoute route);
  Future<void> startNavigation(MapRoute route);
  Future<void> stopNavigation();

  @override
  void dispose() {
    disposeAllSubscriptions();
    super.dispose();
  }
}
