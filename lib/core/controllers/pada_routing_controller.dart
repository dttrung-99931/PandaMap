import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_route.dart';

abstract class PandaRoutingController {
  Future<void> init();
  Future<MapRoute?> findRoute({
    required MapLocation start,
    required MapLocation dest,
  });
  Future<void> showRoute(MapRoute route);
}
