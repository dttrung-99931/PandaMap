// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapPolyline {
  final List<MapLocation> vertices;
  final Color color;
  final double width;

  MapPolyline({
    required this.vertices,
    required this.color,
    this.width = 20,
  });
}
