import 'package:dio/dio.dart';
import 'package:location/location.dart' as location;
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';
import 'package:panda_map/core/services/map_api_service.dart';

class GoogleMapAPIService implements MapAPIService  {
  GoogleMapAPIService._();
  static GoogleMapAPIService? _instance;
  factory GoogleMapAPIService() {
    return _instance ??= GoogleMapAPIService._();
  }

  static const String googleMapSearchUrl = 'https://places.googleapis.com/v1/places:searchText';
  final location.Location _location = location.Location();
  late final Dio _httpClient = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': PandaMap.options.mapAPIKey,
        'X-Goog-FieldMask': 'places.displayName,'  
          'places.formattedAddress,'
          'places.priceLevel,'
          'places.location,'
      }
    )
  );
  
  @override
  Future<MapSearchResultDto> searchLocations(String text) async {
    Response res = await _httpClient.post(googleMapSearchUrl,
      data: {
          'textQuery': text
      },
    );
    Map<String, dynamic> data = res.data;
    return MapSearchResultDto.fromMap(data);
  }
}
