// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panda_map/controllers/map_controller.dart';

import 'widgets/map_action_button.dart';

class MapUIOptions {
  final bool showCurrentPositionBtn;
  final bool showMapLayerBtn;
  final bool showSearchBar;
  const MapUIOptions({
    this.showCurrentPositionBtn = true,
    this.showSearchBar = true,
    this.showMapLayerBtn = false,
  });
}

class PandaMapWidget extends StatelessWidget {
  PandaMapWidget({
    super.key,
    MapController? controller,
    this.options = const MapUIOptions(),
  }) : controller = controller ?? MapController();

  static const _kVNPosition = CameraPosition(target: LatLng(10, 106), zoom: 16);
  final MapController controller;
  final MapUIOptions options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return GoogleMap(
                mapType: controller.mapType,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: PandaMapWidget._kVNPosition,
                markers: controller.markers,
                circles: controller.circles,
                onTap: (latlng) {
                  if (Random().nextInt(2) == 1) {
                    controller.addMarker(latlng);
                  } else {
                    controller.addRandomCircle(latlng);
                  }
                },
                compassEnabled: true,
              );
            },
          ),
          if (options.showMapLayerBtn)
            Positioned(
              right: 16,
              top: 16,
              child: MapActionButton(
                icon: Icons.layers_outlined,
                onPressed: controller.changeMapType,
              ),
            ),
          if (options.showCurrentPositionBtn)
            Positioned(
              right: 16,
              bottom: 16,
              child: MapActionButton(
                icon: Icons.location_searching_outlined,
                onPressed: controller.focusCurrentLocation,
              ),
            ),
        ],
      ),
    );
  }
}
