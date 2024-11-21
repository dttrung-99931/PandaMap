// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/core/services/map_service.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/panda_map_plugin.dart';
import 'package:panda_map/panda_map_ui_options.dart';

abstract class PandaMap {
  static PandaMapPlugin? _plugin;
  static PandaMapPlugin get plugin {
    if (_plugin == null) {
      throw 'PandaMap is not set';
    }
    return _plugin!;
  }

  static bool get isInitilized => _plugin != null;

  static PandaMapController get controller => plugin.controller;
  static PandaRoutingController get routingController =>
      plugin.routingController;
  static MapAPIService get mapApiService => plugin.service;
  static MapService get mapService => MapService();
  static MapOptions get options => plugin.options;
  static MapUIOptions get uiOptions => plugin.uiOptions;

  static Future<void> initialize({required PandaMapPlugin plugin}) async {
    _plugin = plugin;
    await mapService.init();
    await plugin.init();
  }

  static Future<void> dispose() async {
    assert(_plugin != null, 'You need setPlugin first');
    plugin.dispose();
    _plugin = null;
  }
}
