import 'package:panda_map/core/dtos/map_address_component_dto.dart';

class MapAddressComponent {
  final String provinceOrCity;
  final String district;
  final String communeOrWard;
  final String streetAndHouseNum;
  String get address {
    return '$streetAndHouseNum $communeOrWard $district $provinceOrCity';
  }

  MapAddressComponent({
    required this.provinceOrCity,
    required this.district,
    required this.communeOrWard,
    required this.streetAndHouseNum,
  });

  factory MapAddressComponent.fromDto(MapAddressComponentDto dto) {
    return MapAddressComponent(
      provinceOrCity: dto.provinceOrCity,
      district: dto.district,
      communeOrWard: dto.communeOrWard,
      streetAndHouseNum: dto.streetAndHouseNum,
    );
  }
}
