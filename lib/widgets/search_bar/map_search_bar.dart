// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:panda_map/controllers/map_access_controller.dart';
import 'package:panda_map/models/map_search_result.dart';
import 'package:panda_map/widgets/search_bar/map_search_bar_widget.dart';

class MapSearchBar extends StatefulWidget {
  const MapSearchBar({
    Key? key,
    this.onWillPop,
  }) : super(key: key);
  final Future<bool> Function()? onWillPop;

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  final MapAccessController _controller = MapAccessController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop,
      child: Column(
        children: [
          MapSearchBarWidget(
            onEditingComplete: (text) {},
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _controller.searchResultsNotifier,
              builder: (_, List<MapSearchResult> searchLocations, __) {
                return ListView.builder(
                  itemCount: searchLocations.length,
                  itemBuilder: (context, index) {
                    MapSearchResult location = searchLocations[index];
                    return SearchLocationItem(location: location);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class SearchLocationItem extends StatelessWidget {
  const SearchLocationItem({
    super.key,
    required this.location,
  });

  final MapSearchResult location;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            Text(location.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(location.location.lat.toString()),
                const SizedBox(height: 8),
                Text(location.location.long.toString()),
              ],
            ),
          ],
        ));
  }
}
