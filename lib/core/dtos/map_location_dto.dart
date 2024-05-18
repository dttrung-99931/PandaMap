// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MapLocationDto {
  MapLocationDto({
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory MapLocationDto.fromMap(Map<String, dynamic> map) {
    return MapLocationDto(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapLocationDto.fromJson(String source) => MapLocationDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
