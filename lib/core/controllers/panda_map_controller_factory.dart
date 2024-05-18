import 'package:panda_map/controllers/google_panda_map_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';

class PandaMapControllerFactory {
  static PandaMapController getController(PandaMapType type){
    switch (PandaMap.options.mapType) {
      case PandaMapType.google:
        return GooglePandaMapController();
    }
  }
}