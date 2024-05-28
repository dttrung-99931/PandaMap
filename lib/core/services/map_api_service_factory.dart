
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/services/google_map_api_service.dart';
import 'package:panda_map/core/services/map_api_service.dart';
import 'package:panda_map/services/here_map_api_service.dart';
import 'package:panda_map/services/map_box_api_service.dart';

class MapAPIServiceFactory {

  static MapAPIService getMapAPI(PandaMapType type){
    switch (type) {
      case PandaMapType.google:
        return GoogleMapAPIService();
      case PandaMapType.mapBox:
        return MapBoxAPIService();
      case PandaMapType.heremap:
        return HereMapAPIService();
    }
  }
}
