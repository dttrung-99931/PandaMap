// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_place/google_place.dart';

import 'package:panda_map/models/map_location.dart';

class MapSearchResult {
  final String name;
  final MapLocation location;
  MapSearchResult({
    required this.name,
    required this.location,
  });
  factory MapSearchResult.from(SearchResult result) {
    return MapSearchResult(
      name: result.name ?? '',
      location: MapLocation.fromSearchLocation(result.geometry!.location!),
    );
  }
}
