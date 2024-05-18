// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panda_map/core/dtos/map_search_result_dto.dart';
import 'package:panda_map/core/models/map_place.dart';


class MapSearchResult {
  const MapSearchResult({
    required this.places,
  });
  static MapSearchResult init = const MapSearchResult(places: []);   
  final List<MapPlace> places;


  factory MapSearchResult.fromDto(MapSearchResultDto dto) {
    return MapSearchResult(
      places: dto.places?.map((e) => MapPlace.from(e)).toList() ?? [],
    );
  }

}


