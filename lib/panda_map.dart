// ignore_for_file: public_member_api_docs, sort_constructors_first
class MapOptions {
  /// Required when using Google Place api for seaching,..
  final String googleMapAPIKey;

  const MapOptions({
    required this.googleMapAPIKey,
  });
}

class PandaMap {
  static MapOptions get options {
    if (_options == null) {
      throw 'You init PandaMap by calling PandaMap.config(options) before using PandaMap functions';
    }
    return _options!;
  }

  static MapOptions? _options;
  static Future<void> init({required MapOptions options}) async {
    _options = options;
  }
}
