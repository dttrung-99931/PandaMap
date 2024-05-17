import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:panda_map/controllers/models/map_location.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/services/dtos/map_search_result_dto.dart';

class MapService {
  MapService._();
  static MapService? _instance;
  factory MapService() {
    return _instance ??= MapService._();
  }

  static const String googleMapSearchUrl = 'https://places.googleapis.com/v1/places:searchText';
  final location.Location _location = location.Location();
  late final Dio _httpClient = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': PandaMap.options.googleMapAPIKey,
        'X-Goog-FieldMask': 'places.displayName,places.formattedAddress,places.priceLevel',
      }
    )
  );
  
  Future<MapSearchResultDto> searchLocations(String text) async {
    Response res = await _httpClient.post(googleMapSearchUrl,
      data: {
          'textQuery': text
      },
    );
    Map<String, dynamic> data = res.data;
    return MapSearchResultDto.fromMap(data);
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
