// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MapPlaceDto {
  MapPlaceDto({
    required this.displayName,
    required this.formattedAddress,
  });

  final String formattedAddress;
  final MapPlaceNameDto displayName;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formattedAddress': formattedAddress,
      'displayName': displayName.toMap(),
    };
  }

  factory MapPlaceDto.fromMap(Map<String, dynamic> map) {
    return MapPlaceDto(
      formattedAddress: map['formattedAddress'] as String,
      displayName: MapPlaceNameDto.fromMap(map['displayName'] as Map<String,dynamic>),
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
