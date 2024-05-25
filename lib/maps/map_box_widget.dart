// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:panda_map/controllers/map_box_controller.dart';
import 'package:panda_map/panda_map.dart';

class MapBoxWidget extends StatelessWidget {
  const MapBoxWidget({
    super.key,
    required this.controller,
  });

  final MapBoxController controller;

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      resourceOptions: ResourceOptions(
        accessToken: PandaMap.options.mapAPIKey,
      ),
      cameraOptions: CameraOptions(),
      onMapCreated: controller.onMapCreated,
    );
  }
}
