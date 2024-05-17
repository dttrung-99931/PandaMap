// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panda_map/controllers/models/map_location.dart';
import 'package:panda_map/services/dtos/search_result_dto.dart';

class MapSearchResult {
  final String name;
  final MapLocation location;
  MapSearchResult({
    required this.name,
    required this.location,
  });
  factory MapSearchResult.from(SearchResultDto result) {
    return MapSearchResult(
      name: 'result.name',
      location: MapLocation.fromSearchLocation(SearchResultDto()),
    );
  }
}
