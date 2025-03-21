import 'package:flutter/material.dart';

class Constants {
  static const sucessfulStatusCodes = [201, 200];
  static const minDistanceChangeInMetters = 3;
  static const double defaultZoomLevel = 18;
  static const Duration animationDuration = Duration(milliseconds: 600);
  static const int toleranceInMetters = 10; // sai so
}

const emptyWidget = SizedBox.shrink();

enum PandaMapError {
  errorFindingRoute,
  routeNotFound,
}
