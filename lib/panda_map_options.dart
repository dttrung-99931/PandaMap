class MapOptions {
  final String mapAPIKey;

  MapOptions({
    required this.mapAPIKey,
  }) {
    assert(mapAPIKey.isNotEmpty, 'Map api key must not be empty');
  }
}
