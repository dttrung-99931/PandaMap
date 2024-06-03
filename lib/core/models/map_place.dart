// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/dtos/map_place_dto.dart';
import 'package:panda_map/core/models/map_address_component_dto.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapPlace {
  final String placeId; // Used to get placeDetail
  final String displayName;
  final String address;
  final MapLocation location;
  final MapAddressComponent? addressComponent;
  MapPlace({
    required this.placeId,
    required this.displayName,
    required this.address,
    required this.location,
    required this.addressComponent,
  });
  factory MapPlace.from(MapPlaceDto dto) {
    return MapPlace(
      placeId: dto.placeId,
      address: dto.formattedAddress,
      displayName: dto.displayName.text, 
      location: MapLocation.fromDto(dto.location), 
      addressComponent: dto.addressComponent != null ? MapAddressComponent.fromDto(dto.addressComponent!) : null,
    );
  }
}
