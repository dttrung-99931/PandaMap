// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

extension GlobalKeyExt on GlobalKey {
  Offset get position {
    RenderBox? renderBox = (currentContext?.findRenderObject() as RenderBox?);
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  /// Capture widget
  ///
  /// Wrap widget with RepaintBoundary and use global key of  RepaintBoundary to call this method to capture image
  Future<Uint8List?> captureWidgetImage({double pixelRatio = 1}) async {
    try {
      RenderObject? renderObj = currentContext?.findRenderObject();
      if (renderObj is! RenderRepaintBoundary) {
        return null;
      }
      RenderRepaintBoundary boundary = renderObj;
      var image = await boundary.toImage(pixelRatio: pixelRatio);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      log('Capture widget image error $e');
      return null;
    }
  }
}
