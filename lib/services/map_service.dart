import 'dart:developer';

import 'package:google_place/google_place.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:panda_map/models/map_location.dart';
import 'package:panda_map/panda_map.dart';

class MapService {
  MapService._();
  static MapService? _instance;
  factory MapService() {
    return _instance ??= MapService._();
  }

  final location.Location _location = location.Location();
  late final GooglePlace _googlePlace = GooglePlace(PandaMap.options.googleMapAPIKey);

  Future<List<SearchResult>> searchLocations(String text) async {
    TextSearchResponse? result = await _googlePlace.search.getTextSearch(text);
    return result?.results ?? [];
  }

  Future<MapLocation?> getCurrentLocation() async {
    bool locationServiceEnabled = await _location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await _location.requestService();
      if (!locationServiceEnabled) {
        log('Error location service');
        return null;
      }
    }

    bool locationPermissionGranted = await _location.hasPermission() == PermissionStatus.granted;
    if (!locationPermissionGranted) {
      locationPermissionGranted = await _location.requestPermission() == PermissionStatus.granted;

      if (!locationPermissionGranted) {
        log('Error location service');
        return null;
      }
    }

    LocationData locationData = await _location.getLocation();
    return MapLocation.fromLocationData(locationData);
  }
}
