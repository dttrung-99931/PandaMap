import 'package:flutter/foundation.dart';

mixin LoadingHandleMixin {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> load(Future<void> Function() loader) async {
    isLoading.value = true;
    await loader();
    isLoading.value = false;
  }
}
