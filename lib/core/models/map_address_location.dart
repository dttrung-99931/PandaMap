// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/core/models/map_address_component_dto.dart';
import 'package:panda_map/core/models/map_location.dart';

class MapAddressLocation {
  final MapLocation location;
  final MapAddressComponent? address;
  MapAddressLocation({
    required this.location,
    required this.address,
  });
}
