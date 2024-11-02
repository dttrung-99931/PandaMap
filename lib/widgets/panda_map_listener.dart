// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/pada_routing_controller.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/widgets/disposable_mixin.dart';
import 'package:panda_map/widgets/listener_dispose_mixin.dart';

class PandaMapListener extends StatefulWidget {
  const PandaMapListener({
    super.key,
    required this.child,
    this.onNavigationStart,
    this.onLocationChanged,
    this.onMoving,
  });
  final Widget child;
  final Function(MapRoute route)? onNavigationStart;
  final Function(MapCurrentLocation location)? onLocationChanged;
  final Function(MapCurrentLocation location)? onMoving;

  @override
  State<PandaMapListener> createState() => _PandaMapListenerState();
}

class _PandaMapListenerState extends State<PandaMapListener>
    with ListenerDisposeMixin, DisposableMixin {
  final PandaMapController controller = PandaMap.controller;
  final PandaRoutingController routingController = PandaMap.routingController;
  late PandaRoutingStatus _prevRoutingStatus = routingController.status;

  @override
  void initState() {
    _listenNavigationStarted();
    _listenLocationChanged();
    _listenOnMoving();
    super.initState();
  }

  void _listenLocationChanged() {
    addSubscription(controller.locationChangedStream.listen(
      (MapCurrentLocation event) {
        widget.onLocationChanged?.call(event);
      },
    ));
  }

  void _listenOnMoving() {
    addSubscription(routingController.movingLocationStream.listen(
      (MapCurrentLocation event) {
        widget.onMoving?.call(event);
      },
    ));
  }

  void _listenNavigationStarted() {
    addListener(
      routingController,
      () {
        if (routingController.status == PandaRoutingStatus.navigating &&
            _prevRoutingStatus != PandaRoutingStatus.navigating) {
          widget.onNavigationStart?.call(routingController.currentRoute!);
        }
        _prevRoutingStatus = routingController.status;
      },
    );
  }

  @override
  void dispose() {
    removeAllListeners();
    disposeAllSubscriptions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
