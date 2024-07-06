// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_address_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/utils/constants.dart';
import 'package:panda_map/widgets/card.dart';

import 'widgets/map_action_button.dart';

class PandaMapWidget extends StatelessWidget {
  PandaMapWidget({
    super.key,
  });

  final PandaMapController controller = PandaMap.controller;
  final PandaRoutingController routingController = PandaMap.routingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return PandaMap.plugin.buildMap(context, PandaMap.controller);
            },
          ),
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
                  MapActionButton(
                    icon: Icons.location_searching_outlined,
                    onPressed: controller.focusCurrentLocation,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RouteLocations extends StatelessWidget {
  const RouteLocations(this.locations, {super.key});
  final List<MapAddressLocation> locations;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationItem(location: locations.first),
              for (int i = 1; i < locations.length - 1; i++)
                LocationItem(location: locations[i]),
              LocationItem(location: locations.last, showDottedLine: false),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.location,
    this.showDottedLine = true,
  });

  final MapAddressLocation location;
  final bool showDottedLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
      child: Row(
        children: [
          _dot(),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location.address?.address ?? '',
              style: const TextStyle(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: PandaMap.uiOptions.routeColor,
          ),
          child: emptyWidget,
        ),
        // TODO: DOtted line
        // if (showDottedLine)
        //   Positioned(
        //     top: 10,
        //     height: 20,
        //     width: 2,
        //     child: Container(
        //       height: 20,
        //       width: 2,
        //       decoration: const BoxDecoration(
        //         border: Border(
        //           left: BorderSide(
        //             strokeAlign: -0.3,
        //           ),
        //         ),
        //       ),
        //     ),
        //   )
      ],
    );
  }
}
