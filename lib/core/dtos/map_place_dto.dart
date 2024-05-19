// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:panda_map/core/dtos/map_location_dto.dart';

class MapPlaceDto {
  MapPlaceDto({
    required this.formattedAddress,
    required this.displayName,
    required this.location,
    required this.addressComponents,
  });

  final String formattedAddress;
  final MapPlaceNameDto displayName;
  final MapLocationDto location;
  final List<MapAddressComponent> addressComponents;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formattedAddress': formattedAddress,
      'displayName': displayName.toMap(),
      'location': location.toMap(),
      'addressComponents': addressComponents.map((x) => x.toMap()).toList(),
    };
  }

  factory MapPlaceDto.fromMap(Map<String, dynamic> map) {
    return MapPlaceDto(
      formattedAddress: map['formattedAddress'] as String,
      displayName: MapPlaceNameDto.fromMap(map['displayName'] as Map<String,dynamic>),
      location: MapLocationDto.fromMap(map['location'] as Map<String,dynamic>),
      addressComponents: List<MapAddressComponent>.from((map['addressComponents'] as List<dynamic>).map<MapAddressComponent>((x) => MapAddressComponent.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MapPlaceDto.fromJson(String source) => MapPlaceDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MapPlaceNameDto {
  final String text;
  final String? languageCode;
  MapPlaceNameDto({
    required this.text,
    required this.languageCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'languageCode': languageCode,
    };
  }

  factory MapPlaceNameDto.fromMap(Map<String, dynamic> map) {
    return MapPlaceNameDto(
      text: map['text'] as String,
      languageCode: map['languageCode'] != null ? map['languageCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapPlaceNameDto.fromJson(String source) => MapPlaceNameDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MapAddressComponent {
  final String longName;
  final String shortName;
  final String type;
  MapAddressComponent({
    required this.longName,
    required this.shortName,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'longName': longName,
      'shortName': shortName,
      'type': type,
    };
  }

  factory MapAddressComponent.fromMap(Map<String, dynamic> map) {
    return MapAddressComponent(
      longName: map['longName'] as String,
      shortName: map['shortName'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapAddressComponent.fromJson(String source) => MapAddressComponent.fromMap(json.decode(source) as Map<String, dynamic>);
}
