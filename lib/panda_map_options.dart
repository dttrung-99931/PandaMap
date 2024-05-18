
class MapOptions {
  /// Required when using Google Place api for seaching,..
  final String mapAPIKey;
  final PandaMapType mapType;

  MapOptions( {
    required this.mapAPIKey,
    required this.mapType,
  }) : assert(mapAPIKey.isNotEmpty, 'Map api key must not be empty');
}

enum PandaMapType {
  google, 
  // heremap  // TODO:
}




