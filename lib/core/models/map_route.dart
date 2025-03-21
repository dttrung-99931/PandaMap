// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/models/map_address_location.dart';
import 'package:panda_map/core/models/map_bounding_box.dart';
import 'package:panda_map/core/models/map_move_step.dart';
import 'package:panda_map/core/models/map_polyline.dart';

class MapRoute {
  final MapPolylinePanda polyline;
  final List<MapAddressLocation> locations;
  final List<MapMoveStep> moveSteps;
  final MapBoundingBox boundingBox;
  final int lengthInMeters;
  final int durationInMinutes;
  // Ref to sdk route
  final dynamic sdkRoute;

  String get lengthInKm => '${(lengthInMeters / 1000).toStringAsFixed(1)}km';

  MapRoute({
    required this.polyline,
    required this.locations,
    required this.moveSteps,
    required this.boundingBox,
    required this.lengthInMeters,
    required this.durationInMinutes,
    required this.sdkRoute,
  });
}
