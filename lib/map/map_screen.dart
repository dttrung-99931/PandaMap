import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panda_map/map/controllers/map_controller.dart';
import 'package:panda_map/map/widgets/card_icon.dart';

import 'widgets/opacity_button.dart';

class PandaMap extends StatelessWidget {
  PandaMap({super.key, MapController? controller}): 
    controller = controller ?? MapController();
    
  static const _kVNPosition = CameraPosition(target: LatLng(10, 106), zoom: 16);
  final MapController controller;   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return GoogleMap(
                    mapType: controller.mapType,
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: controller.onMapCreated,
                    initialCameraPosition: PandaMap._kVNPosition,
                    markers: controller.markers,
                    circles: controller.circles,
                    onTap: (latlng) {
                      if (Random().nextInt(2) == 1) {
                        controller.addMarker(latlng);
                      } else {
                        controller.addRandomCircle(latlng);
                      }
                    },
                    compassEnabled: true,
                  );
            }
          ),
          Positioned(
            right: 16.r,
            top: 16.r,
            child: buildMapActionIcon(
              icon: Icons.layers_outlined,
              onPressed: controller.changeMapType,
            ),
          ),
          Positioned(
            right: 16.r,
            bottom: 16.r,
            child: buildMapActionIcon(
              icon: Icons.location_searching_outlined,
              onPressed: controller.focusCurrentLocation,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMapActionIcon({
    required IconData icon,
    required Function() onPressed,
  }) {
    return OpacityButton(
      onTap: onPressed,
      child: CardIcon(
        icon,
        size: 24.r,
        padding: EdgeInsets.all(8.r),
      ),
    );
  }
}
