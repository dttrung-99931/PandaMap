// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:panda_map/controllers/map_access_controller.dart';
import 'package:panda_map/models/map_search_result.dart';
import 'package:panda_map/widgets/search_bar/map_search_bar_widget.dart';

class MapSearchBar extends StatefulWidget {
  const MapSearchBar({
    Key? key
  }) : super(key: key);

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  final MapAccessController _controller = MapAccessController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: MapSearchBarWidget(
            onEditingComplete: (String? text) {
              if (text != null && text.isNotEmpty){
                _controller.searchLocations(text);
              }
            },
            autoFocus: true,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _controller.searchResultsNotifier,
          builder: (_, List<MapSearchResult> searchLocations, __) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: searchLocations.length,
              itemBuilder: (context, index) {
                MapSearchResult location = searchLocations[index];
                return SearchLocationItem(location: location);
              },
            );
          },
        )
      ],
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
    return Container(
      color: Colors.white,
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
