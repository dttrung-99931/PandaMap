import 'package:dio/dio.dart';
import 'package:location/location.dart' as location;
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';
import 'package:panda_map/core/services/map_api_service.dart';

class GoogleMapAPIService implements MapAPIService {
  GoogleMapAPIService._();
  static GoogleMapAPIService? _instance;
  factory GoogleMapAPIService() {
    return _instance ??= GoogleMapAPIService._();
  }

  /// new search API url
  static const String searchAPIUrl = 'https://places.googleapis.com/v1/places:searchText';

  /// Find place API url
  static const String findPlaceAPIUrl = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json';

  /// Http client for calling new Google Map APIs
  late final Dio _newAPIHttpClient = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'X-Goog-Api-Key': PandaMap.options.mapAPIKey,
  }));

  /// Http client for calling old Google Map APIs
  late final Dio _oldAPIHttpClient = Dio(BaseOptions(queryParameters: {
    'key': PandaMap.options.mapAPIKey,
  }));

  @override
  Future<MapSearchResultDto> searchLocations(String text) async {
    Response res = await _newAPIHttpClient.post(searchAPIUrl,
        data: {'textQuery': text},
        options: Options(headers: {
          'X-Goog-FieldMask': 'places.displayName,'
              'places.formattedAddress,'
              'places.location,'
        }));
    Map<String, dynamic> data = res.data;
    return MapSearchResultDto.fromMap(data);
  }

  @override
  Future<MapSearchResultDto> findLocations(String text) async {
    Response res = await _oldAPIHttpClient.post(
      findPlaceAPIUrl,
      queryParameters: {
        'inputtype': 'textquery',
        'input': text,
        'fields': 'place_id,formatted_address,geometry,name',
      },
    );
    Map<String, dynamic> data = res.data;

    /// Adapter find place api json => seach result json
    /// More detail about json strucutre: https://developers.google.com/maps/documentation/places/web-service/search-find-place#maps_http_places_findplacefromtext_mca-txt
    Map<String, dynamic> searchConverted = {
      'places': (data['candidates'] as List<dynamic>)
          .map(
            (place) => {
              'formattedAddress': place['formatted_address'],
              'displayName': {'languageCode': '', 'text': place['name']},
              'location': {
                'latitude': place['geometry']['location']['lat'],
                'longitude': place['geometry']['location']['lng'],
              },
            },
          )
          .toList()
    };
    return MapSearchResultDto.fromMap(searchConverted);
  }
}
