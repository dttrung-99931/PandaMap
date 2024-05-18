// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/map_access_controller.dart';
import 'package:panda_map/core/models/map_place.dart';
import 'package:panda_map/core/models/map_search_result.dart';
import 'package:panda_map/widgets/not_found.dart';
import 'package:panda_map/widgets/search_bar/map_search_bar.dart';
import 'package:panda_map/widgets/search_bar/map_search_result_list.dart';

class MapSearch extends StatefulWidget {
  const MapSearch({Key? key, required this.onSelected}) : super(key: key);
  final OnPlaceSelected onSelected;
  
  @override
  State<MapSearch> createState() => _MapSearchState();
}

class _MapSearchState extends State<MapSearch> {
  final MapAccessController _controller = MapAccessController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 6),
          child: ValueListenableBuilder(
            valueListenable: _controller.isLoading,
            builder: (context, isLoading, child) => MapSearchBarWidget(
              // Set controller to keep input text when MapSearchBarWidget re-build due to loading changed
              controller: _controller.searchController,
              hint: 'Nhập tìm địa chỉ',
              onEditingComplete: (String? text) {
                if (text != null && text.isNotEmpty) {
                  _controller.searchLocations(text);
                }
              },
              autoFocus: true,
              showLoading: isLoading,
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _controller.searchResultNotifier,
          builder: (_, MapSearchResult result, __) {
            if (result.places.isNotEmpty) {
              return Flexible(
                child: MapSearchResultList(
                  result.places,
                  onSelected: widget.onSelected,
                ),
              );
            }
            if (result == MapSearchResult.init) {
              return const SizedBox.shrink();
            }
            return const SizedBox(height: 48, child: NotFound());
          },
        )
      ],
    );
  }
}
