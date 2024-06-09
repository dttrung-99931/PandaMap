// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/panda_map_options.dart';

abstract class PandaMapPlugin {
  PandaMapPlugin({
    required this.options,
  });
  final MapOptions options;
  PandaMapController? _controller;
  MapAPIService? _service;

  PandaMapController get controller {
    _checkInit();
    return _controller!;
  }

  MapAPIService get service {
    if (_service == null) {
      throw 'PadaMapPlugg has not initialized';
    }
    return _service!;
  }

  PandaMapController createController();

  MapAPIService createService();

  Future<void> init() async {
    _controller = createController();
    _service = createService();
    await controller.init(options);
  }

  Widget buildMap(BuildContext context, PandaMapController controller);

  void _checkInit() {
    if (_controller == null) {
      throw 'PadaMapPlugg has not initialized';
    }
  }
}
