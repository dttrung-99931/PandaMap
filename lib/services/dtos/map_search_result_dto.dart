import 'dart:convert';

import 'package:panda_map/services/dtos/map_place_dto.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MapSearchResultDto {
  final List<MapPlaceDto>? places;
  MapSearchResultDto({
    required this.places,
  });


  factory MapSearchResultDto.fromMap(Map<String, dynamic> map) {
    return MapSearchResultDto(
      places: map['places'] != null ? List<MapPlaceDto>.from((map['places'] as List<dynamic>).map<MapPlaceDto?>((x) => MapPlaceDto.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  factory MapSearchResultDto.fromJson(String source) => MapSearchResultDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
