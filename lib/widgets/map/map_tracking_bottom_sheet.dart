// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/map_tracking_controller.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_widget.dart';

class MapTrackingBottomSheet extends StatefulWidget {
  const MapTrackingBottomSheet({
    super.key,
    required this.options,
    required this.controller,
  });
  final MapTrackingOptions options;
  final MapTrackingController controller;

  @override
  State<MapTrackingBottomSheet> createState() => _MapTrackingBottomSheetState();
}

class _MapTrackingBottomSheetState extends State<MapTrackingBottomSheet>
    with TickerProviderStateMixin {
  late final AnimationController _animController;

  @override
  void initState() {
    widget.controller.startTracking(widget.options);
    _animController = BottomSheet.createAnimationController(
      this,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn,
      ),
    );
    _animController.addStatusListener(_animStatusListener);
    super.initState();
  }

  void _animStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.reverse) {
      _onClose();
    }
  }

  void _onClose() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    widget.controller.stopTracking();
    _animController.removeStatusListener(_animStatusListener);
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PandaMap.uiOptions.bottomSheetShawdowColor,
      child: TapRegion(
        onTapOutside: (event) {
          _onClose();
        },
        child: BottomSheet(
          animationController: _animController,
          elevation: 4,
          shadowColor: PandaMap.uiOptions.bottomSheetShawdowColor,
          backgroundColor: Colors.white,
          showDragHandle: true,
          onClosing: _onClose,
          builder: (context) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Container(
                // height: 0.8.sh,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: PandaMapWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
