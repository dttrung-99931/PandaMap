// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_place.dart';
import 'package:panda_map/widgets/search_bar/map_search.dart';

class MapSearchDialog extends StatelessWidget {
  const MapSearchDialog({
    Key? key,
    required this.onSelected,
  }) : super(key: key);
  final Function(MapPlace place) onSelected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: MapSearch(onSelected: onSelected),
    );
  }
}
