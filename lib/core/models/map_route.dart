// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/models/map_address_location.dart';
import 'package:panda_map/core/models/map_move_step.dart';
import 'package:panda_map/core/models/map_polyline.dart';

class MapRoute {
  final MapPolylinePanda polyline;
  final List<MapAddressLocation> locations;
  final List<MapMoveStep> moveSteps;
  MapRoute({
    required this.polyline,
    required this.locations,
    required this.moveSteps,
  });
}
