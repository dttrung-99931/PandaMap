// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_search_result.dart';

class MapSearchResultList extends StatelessWidget {
  const MapSearchResultList(
    this.searchLocations, {
    super.key,
  });
  final List<MapPlace> searchLocations;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4),
        shrinkWrap: true,
        itemCount: searchLocations.length,
        itemBuilder: (context, index) {
          MapPlace location = searchLocations[index];
          return SearchLocationItem(location: location);
        },
      ),
    );
  }
}

class SearchLocationItem extends StatelessWidget {
  const SearchLocationItem({
    super.key,
    required this.location,
  });

  final MapPlace location;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.displayName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              location.address,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            // const SizedBox(height: 4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(location.location.lat.toString()),
            //     const SizedBox(height: 8),
            //     Text(location.location.long.toString()),
            //   ],
            // ),
          ],
        ));
  }
}
