import 'package:flutter/services.dart';

class AssetUtils {
  static Future<Uint8List> loadAssetImage(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    return Uint8List.view(byteData.buffer);
  }
}
