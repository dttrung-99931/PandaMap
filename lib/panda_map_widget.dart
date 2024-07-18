// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/panda_map.dart';

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
          AnimatedBuilder(
            animation: controller.mode,
            builder: (_, __) {
              return PandaMap.plugin.buildMapOverlay(
                context,
                controller.mode.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
