// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/models/map_location.dart';

class MapBoundingBox {
  /// South west corner coordinates.
  final MapLocation southWestCorner;

  /// North east corner coordinates.
  final MapLocation northEastCorner;
  MapBoundingBox({
    required this.southWestCorner,
    required this.northEastCorner,
  });
}
