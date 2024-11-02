import 'package:flutter/material.dart';

typedef ChangeNotifierListener<T> = void Function();

mixin ListenerDisposeMixin {
  final Map<ChangeNotifier, List<dynamic>> _listeners = {};

  void addListener<T>(
    ChangeNotifier notifier,
    ChangeNotifierListener<T> listener,
  ) {
    notifier.addListener(listener);
    _listeners[notifier] = (_listeners[notifier] ?? [])..add(listener);
  }

  void removeAllListeners() {
    for (MapEntry<ChangeNotifier, List> pair in _listeners.entries) {
      for (var listener in pair.value) {
        pair.key.removeListener(listener);
      }
    }
  }
}
