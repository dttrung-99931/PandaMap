// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/panda_map.dart';

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
    this.options = const MapUIOptions(),
  });

  late final PandaMapController controller = PandaMap.controller;
  final MapUIOptions options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return PandaMap.plugin.buildMap(context);
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
