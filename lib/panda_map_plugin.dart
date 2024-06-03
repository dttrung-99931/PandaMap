// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/base_panda_map_plugin.dart';
import 'package:panda_map/panda_map_options.dart';

abstract class PandaMapPlugin {
  static BasePandaMapPlugin? _plugin;
  static BasePandaMapPlugin get plugin {
    if (_plugin == null) {
      throw 'PandaMap is not set';
    }
    return _plugin!;
  }

  static set plugin(value) => _plugin = value;

  static PandaMapController get controller => plugin.controller;
  static MapAPIService get service => plugin.service;
  static MapOptions get options => plugin.options;

  static Future<void> init({required MapOptions options}) async {
    await plugin.init(options: options);
  }
}
