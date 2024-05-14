import 'package:flutter/material.dart';
import 'package:panda_map/widgets/map_action_button.dart';
import 'package:panda_map/widgets/search_bar/map_search_bar.dart';

class MapSearchButton extends StatefulWidget {
  const MapSearchButton({super.key});

  @override
  State<MapSearchButton> createState() => _MapSearchButtonState();
}

class _MapSearchButtonState extends State<MapSearchButton> {
  OverlayEntry? _entry;

  @override
  Widget build(BuildContext context) {
    return MapActionButton(
      onPressed: () {
        _entry = OverlayEntry(
          builder: (context) {
            return TapRegion(
              onTapOutside: (event) {
                _entry?.remove();
              },
              child: Material(child: MapSearchBar(
                onWillPop: () async {
                  _entry?.remove();
                  return false;
                },
              )),
            );
          },
        );
        Overlay.of(context).insert(_entry!);
      },
      icon: Icons.search_outlined,
    );
  }
}
