// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_mode.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/panda_map_ui_options.dart';
import 'package:panda_map/widgets/map/map_normal_overlay.dart';

abstract class PandaMapPlugin {
  PandaMapPlugin({
    required this.options,
    this.uiOptions = const MapUIOptions(),
  });
  final MapOptions options;
  final MapUIOptions uiOptions;
  PandaMapController? _controller;
  PandaRoutingController? _routingController;
  MapAPIService? _service;

  PandaMapController get controller {
    _checkInit();
    return _controller!;
  }

  PandaRoutingController get routingController {
    _checkInit();
    return _routingController!;
  }

  MapAPIService get service {
    if (_service == null) {
      throw 'PadaMapPlugg has not initialized';
    }
    return _service!;
  }

  PandaMapController createController();

  PandaRoutingController createRoutingController(
    PandaMapController mapController,
  );

  MapAPIService createService();

  Future<void> init() async {
    _controller = createController();
    _routingController = createRoutingController(_controller!);
    _service = createService();
    await controller.init(options);
    await routingController.init();
  }

  void dispose() async {
    assert(_controller != null,
        'PandaMapPlugin has not been setup. Use PandaMap.setPlugin to setup first');
    _controller?.dispose();
    _routingController?.dispose();
    _service = null;
  }

  Widget buildMap(BuildContext context, PandaMapController controller);

  Widget buildMapOverlay(BuildContext context, MapMode mode) {
    switch (mode) {
      case MapMode.normal:
        return MapNormalOverlay(
          routingController: routingController,
          controller: controller,
        );
      case MapMode.navigation:
        return const Center(
          child: Text('Navigation ui not implemented'),
        );
    }
  }

  void _checkInit() {
    if (_controller == null) {
      throw 'PadaMapPlugg has not initialized';
    }
  }
}
