
class MapOptions {
  /// map API key is:
  /// - gogole map api key
  /// - map box public token 
  final String mapAPIKey;
  /// Only used for [MapType.heremap]
  final String mapAPIKeyId;
  final PandaMapType mapType;

  MapOptions( {
    required this.mapAPIKey,
    required this.mapType,
    this.mapAPIKeyId = '', 
  }) {
     assert(mapAPIKey.isNotEmpty, 'Map api key must not be empty');
     assert(mapType == PandaMapType.heremap && mapAPIKeyId.isNotEmpty, 'Heremap requried mapAPIKeyId');
  }
}

enum PandaMapType {
  google, 
  mapBox, 
  heremap,
}




