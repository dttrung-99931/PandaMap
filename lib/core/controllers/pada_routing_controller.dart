import 'package:flutter/foundation.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_move_step.dart';
import 'package:panda_map/core/models/map_route.dart';

abstract class PandaRoutingController extends ChangeNotifier {
  MapRoute? get currentRoute;
  MapMoveStep get currentMoveStep;
  Future<void> init();
  Future<MapRoute?> findRoute({
    required MapLocation start,
    required MapLocation dest,
  });
  Future<void> showRoute(MapRoute route);
}
