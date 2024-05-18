// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panda_map/panda_map_options.dart';

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