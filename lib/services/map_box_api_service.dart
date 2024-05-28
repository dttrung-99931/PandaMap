import 'package:panda_map/core/dtos/map_place_detail_dto.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';
import 'package:panda_map/core/services/map_api_service.dart';

class MapBoxAPIService implements MapAPIService {
  MapBoxAPIService._();
  static MapBoxAPIService? _instance;
  factory MapBoxAPIService() {
    return _instance ??= MapBoxAPIService._();
  }


  @override
  Future<MapSearchResultDto> searchLocations(String text) async {
    throw 'Not implemented';
  }

  @override
  Future<MapSearchResultDto> findLocations(String text) async {
      throw 'Not implemented';
}

  @override
  Future<MapPlaceDetailDto> getPlaceDetail(String placeId) async {
      throw 'Not implemented';
  }
}
