import 'package:flutter/material.dart';
import 'package:panda_map/controllers/loading_handle_mixin.dart';
import 'package:panda_map/controllers/models/map_search_result.dart';
import 'package:panda_map/services/dtos/search_result_dto.dart';
import 'package:panda_map/services/map_service.dart';

// Control map data access actions like searching, ..
class MapAccessController with LoadingHandleMixin {
  late final MapService _service = MapService();
  ValueNotifier<List<MapSearchResult>> searchResultsNotifier = ValueNotifier([]);

  Future<void> searchLocations(String text) async {
    await load(() async {
      List<SearchResultDto> res = await _service.searchLocations(text);
      searchResultsNotifier.value = res.map((e) => MapSearchResult.from(e)).toList();
    });
  }
}
