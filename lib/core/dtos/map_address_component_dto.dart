// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MapAddressComponentDto {
  final String provinceOrCity;
  final String district;
  final String communeOrWard;
  final String streetAndHouseNum;
  MapAddressComponentDto({
    required this.provinceOrCity,
    required this.district,
    required this.communeOrWard,
    required this.streetAndHouseNum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provinceOrCity': provinceOrCity,
      'district': district,
      'communeOrWard': communeOrWard,
      'streetAndHouseNum': streetAndHouseNum,
    };
  }

  factory MapAddressComponentDto.fromMap(Map<String, dynamic> map) {
    return MapAddressComponentDto(
      provinceOrCity: map['provinceOrCity'] as String,
      district: map['district'] as String,
      communeOrWard: map['communeOrWard'] as String,
      streetAndHouseNum: map['streetAndHouseNum'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapAddressComponentDto.fromJson(String source) =>
      MapAddressComponentDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
