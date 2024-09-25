// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/panda_map.dart';

class MapPolylinePanda {
  final List<MapLocation> vertices;
  final Color color;
  final double width;

  MapPolylinePanda({
    required this.vertices,
    required this.color,
    this.width = 20,
  });

  factory MapPolylinePanda.fromVertices(List<MapLocation> vertices) {
    return MapPolylinePanda(
      vertices: vertices,
      color: PandaMap.uiOptions.routeColor,
    );
  }

  MapPolylinePanda copyWith({
    List<MapLocation>? vertices,
    Color? color,
    double? width,
  }) {
    return MapPolylinePanda(
      vertices: vertices ?? this.vertices,
      color: color ?? this.color,
      width: width ?? this.width,
    );
  }
}
