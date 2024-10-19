import 'package:flutter/foundation.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_move_step.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';

abstract class PandaRoutingController extends ChangeNotifier
    with DisposableMixin {
  bool get isNavigating => currentRoute != null;
  MapRoute? get currentRoute;
  MapRoute? get previewRoute;
  MapMoveStep get currentMoveStep;
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
