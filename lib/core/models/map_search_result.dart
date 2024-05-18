// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/dtos/map_place_dto.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';


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


class MapPlace {
  final String displayName;
  final String address;
  final MapLocation location;
  MapPlace({
    required this.displayName,
    required this.location,
    required this.address,
  });
  factory MapPlace.from(MapPlaceDto dto) {
    return MapPlace(
      address: dto.formattedAddress,
      displayName: dto.displayName.text,
      // TODO
      location: MapLocation(lat: 100, long: 10),
    );
  }
}
