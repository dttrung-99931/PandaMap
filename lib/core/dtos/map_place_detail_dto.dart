// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:panda_map/core/dtos/map_location_dto.dart';

class MapPlaceDetailDto {
  final String text;
  final String? languageCode;
  MapPlaceDetailDto({
    required this.text,
    required this.languageCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'languageCode': languageCode,
    };
  }

  factory MapPlaceDetailDto.fromMap(Map<String, dynamic> map) {
    return MapPlaceDetailDto(
      text: map['text'] as String,
      languageCode: map['languageCode'] != null ? map['languageCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapPlaceDetailDto.fromJson(String source) => MapPlaceDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
