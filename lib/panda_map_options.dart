
class MapOptions {
  /// map API key is:
  /// - gogole map api key
  /// - map box public token 
  final String mapAPIKey;
  final PandaMapType mapType;

  MapOptions( {
    required this.mapAPIKey,
    required this.mapType,
  }) : assert(mapAPIKey.isNotEmpty, 'Map api key must not be empty');
}

enum PandaMapType {
  google, 
  mapBox, 
  // heremap  // TODO:
}




