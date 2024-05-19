// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:panda_map/widgets/map_action_button.dart';
import 'package:panda_map/widgets/search_bar/map_search.dart';
import 'package:panda_map/widgets/search_bar/map_search_result_list.dart';

class MapSearchButton extends StatefulWidget {
  const MapSearchButton({
    Key? key,
    required this.onSelected,
    this.hideOnSelected = true,
  }) : super(key: key);
  final OnPlaceSelected onSelected;
  final bool hideOnSelected;

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
        if (_isSearchBarShowing) {
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
                  SafeArea(
                    child: MapSearch(
                      onSelected: (place) {
                        widget.onSelected(place);
                        if (widget.hideOnSelected) {
                          _hideSearchBar();
                        }
                      },
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
    _updateIfMounted();
  }

  void _hideSearchBar() {
    _entry?.remove();
    _isSearchBarShowing = false;
    _updateIfMounted();
  }

  void _updateIfMounted() {
    if (mounted) {
      setState(() {});
    }
  }
}
