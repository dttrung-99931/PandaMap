// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_address_location.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/utils/constants.dart';
import 'package:panda_map/widgets/card.dart';

class RouteLocations extends StatelessWidget {
  const RouteLocations(this.locations, {super.key});
  final List<MapAddressLocation> locations;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationItem(location: locations.first),
              for (int i = 1; i < locations.length - 1; i++)
                LocationItem(location: locations[i]),
              LocationItem(location: locations.last, showDottedLine: false),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.location,
    this.showDottedLine = true,
  });

  final MapAddressLocation location;
  final bool showDottedLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
      child: Row(
        children: [
          _dot(),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location.address?.address ?? '',
              style: const TextStyle(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: PandaMap.uiOptions.routeColor,
          ),
          child: emptyWidget,
        ),
        // TODO: DOtted line
        // if (showDottedLine)
        //   Positioned(
        //     top: 10,
        //     height: 20,
        //     width: 2,
        //     child: Container(
        //       height: 20,
        //       width: 2,
        //       decoration: const BoxDecoration(
        //         border: Border(
        //           left: BorderSide(
        //             strokeAlign: -0.3,
        //           ),
        //         ),
        //       ),
        //     ),
        //   )
      ],
    );
  }
}
