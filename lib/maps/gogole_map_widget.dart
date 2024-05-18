// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panda_map/controllers/google_panda_map_controller.dart';
import 'package:panda_map/panda_map_widget.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    super.key,
    required this.controller,
  }) ;

  final GooglePandaMapController controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: controller.mapType,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: controller.onMapCreated,
      initialCameraPosition: PandaMapWidget.vnPosition,
      markers: controller.markers,
      circles: controller.circles,
      onTap: (latlng) {
        if (Random().nextInt(2) == 1) {
          controller.addMarker(latlng.toMapLatLng());
        } else {
          controller.addRandomCircle(latlng.toMapLatLng());
        }
      },
      compassEnabled: true,
    );
  }
}
