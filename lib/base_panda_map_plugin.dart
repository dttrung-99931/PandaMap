// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/panda_map_options.dart';

abstract class BasePandaMapPlugin {
  PandaMapController? _controller;
  MapOptions? _options;
  MapAPIService? _service;

  MapOptions get options {
    _checkInit();
    return _options!;
  }

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

  PandaMapController getController();

  MapAPIService getService();

  Future<void> init({required MapOptions options}) async {
    _options = options;
    _controller = getController();
    _service = getService();
    await controller.init(options);
  }

  Widget buildMap(BuildContext context);

  void _checkInit() {
    if (_controller == null) {
      throw 'PadaMapPlugg has not initialized';
    }
  }
}
