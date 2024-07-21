// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/utils/constants.dart';
import 'package:panda_map/widgets/map/current_location_button.dart';
import 'package:panda_map/widgets/map/route_locations.dart';
import 'package:panda_map/widgets/map_action_button.dart';

class MapNormalOverlay extends StatelessWidget {
  const MapNormalOverlay({
    super.key,
    required this.routingController,
    required this.controller,
  });

  final PandaRoutingController routingController;
  final PandaMapController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          right: 16,
          top: 8,
          child: SafeArea(
            child: AnimatedBuilder(
              animation: routingController,
              builder: (context, child) {
                MapRoute? currentRoute = routingController.currentRoute;
                return currentRoute != null
                    ? RouteLocations(currentRoute.locations)
                    : emptyWidget;
              },
            ),
          ),
        ),
        if (PandaMap.uiOptions.showMapLayerBtn)
          Positioned(
            right: 16,
            top: 16,
            child: MapActionButton(
              icon: Icons.layers_outlined,
              onPressed: controller.changeMapType,
            ),
          ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MapActionButton(
                icon: Icons.add,
                onPressed: controller.zoomOut,
              ),
              const SizedBox(height: 8),
              MapActionButton(
                icon: Icons.remove,
                onPressed: controller.zoomIn,
              ),
              const SizedBox(height: 8),
              if (PandaMap.uiOptions.showCurrentPositionBtn)
                CurrentLocationButton(controller: controller),
            ],
          ),
        ),
      ],
    );
  }
}
