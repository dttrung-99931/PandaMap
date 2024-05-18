
class MapOptions {
  /// Required when using Google Place api for seaching,..
  final String mapAPIKey;
  final PandaMapType mapType;

  const MapOptions( {
    required this.mapAPIKey,
    required this.mapType,
  });
}

enum PandaMapType {
  google, 
  // heremap  // TODO:
}




