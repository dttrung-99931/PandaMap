// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_move_action.dart';

class MapMoveStep {
  MapMoveStep({
    required this.action,
    required this.location,
    required this.text,
  });
  final MapMoveAction action;
  final MapLocation location;
  // Describe in detail the move step
  final String text;
}
