import 'package:panda_map/core/dtos/map_search_result_dto.dart';

abstract class MapAPIService {
  Future<MapSearchResultDto> searchLocations(String text);
}

