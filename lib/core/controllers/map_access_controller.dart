import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/loading_handle_mixin.dart';
import 'package:panda_map/core/models/map_search_result.dart';
import 'package:panda_map/panda_map_plugin.dart';
import 'package:panda_map/core/dtos/map_search_result_dto.dart';
import 'package:panda_map/core/services/map_api_service.dart';

// Control map data access actions like searching, ..
class MapAccessController with LoadingHandleMixin {
  late final MapAPIService _service = PandaMapPlugin.service;
  ValueNotifier<MapSearchResult> searchResultNotifier =
      ValueNotifier(MapSearchResult.init);
  TextEditingController searchController = TextEditingController();

  Future<void> searchLocations(String text) async {
    await load(() async {
      MapSearchResultDto result = await _service.searchLocations(text);
      searchResultNotifier.value = MapSearchResult.fromDto(result);
    });
  }

  Future<void> findLocations(String address) async {
    await load(() async {
      MapSearchResultDto result = await _service.findLocations(address);
      searchResultNotifier.value = MapSearchResult.fromDto(result);
    });
  }
}
