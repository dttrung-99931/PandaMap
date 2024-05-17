import 'package:flutter/material.dart';
import 'package:panda_map/widgets/map_action_button.dart';
import 'package:panda_map/widgets/search_bar/map_search.dart';

class MapSearchButton extends StatefulWidget {
  const MapSearchButton({super.key});

  @override
  State<MapSearchButton> createState() => _MapSearchButtonState();
}

class _MapSearchButtonState extends State<MapSearchButton> {
  OverlayEntry? _entry;
  bool _isSearchBarShowing = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isSearchBarShowing){
          _hideSearchBar();
          return false;
        }
        return true;
      },
      child: MapActionButton(
        isVisible: !_isSearchBarShowing,
        onPressed: () {
          _entry = OverlayEntry(
            builder: (context) {
              return Stack(
                children: [
                  Positioned.fill(child: GestureDetector(
                    onTap: () {
                      _hideSearchBar();
                    },
                  )),
                  const SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: MapSearch(),
                    ),
                  ),
                ],
              );
            },
          );
          _showSearchBar(context);
        },
        icon: Icons.search_outlined,
      ),
    );
  }

  void _showSearchBar(BuildContext context) {
    Overlay.of(context).insert(_entry!);
    _isSearchBarShowing = true;
    setState(() {});
  }

  void _hideSearchBar() {
    _entry?.remove();
    _isSearchBarShowing = false;
    setState(() {});
  }
}
