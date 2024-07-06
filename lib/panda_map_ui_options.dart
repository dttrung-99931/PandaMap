import 'package:flutter/material.dart';

class MapUIOptions {
  final bool showCurrentPositionBtn;
  final bool showMapLayerBtn;
  final bool showSearchBar;
  final Color routeColor;
  final Color iconColor;
  const MapUIOptions({
    this.showCurrentPositionBtn = true,
    this.showSearchBar = true,
    this.showMapLayerBtn = false,
    this.routeColor = Colors.purple,
    this.iconColor = Colors.purple,
  });
}
