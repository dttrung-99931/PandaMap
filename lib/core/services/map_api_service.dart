import 'package:panda_map/core/dtos/map_place_detail_dto.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';

abstract class MapAPIService {
  // Search like 'ATMs, restaurents, ...'
  Future<MapSearchResultDto> searchLocations(String text);
  
  // Find locaiton by address text (complex)
  Future<MapSearchResultDto> findLocations(String address);

  Future<MapPlaceDetailDto> getPlaceDetail(String placeId);
}

