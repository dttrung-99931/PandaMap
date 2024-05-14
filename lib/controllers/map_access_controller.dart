import 'package:flutter/material.dart';
import 'package:google_place/src/search/search_result.dart';
import 'package:panda_map/controllers/loading_handle_mixin.dart';
import 'package:panda_map/models/map_search_result.dart';
import 'package:panda_map/services/map_service.dart';

// Control map data access actions like searching, ..
class MapAccessController with LoadingHandleMixin {
  late final MapService _service = MapService();
  ValueNotifier<List<MapSearchResult>> searchResultsNotifier = ValueNotifier([]);

  Future<void> searchLocations(String text) async {
    await load(() async {
      List<SearchResult> res = await _service.searchLocations(text);
      searchResultsNotifier.value = res.map((e) => MapSearchResult.from(e)).toList();
    });
  }
}
