// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:panda_map/core/controllers/panda_map_controller.dart';
import 'package:panda_map/widgets/map_action_button.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({
    super.key,
    required this.controller,
  });

  final PandaMapController controller;

  @override
  Widget build(BuildContext context) {
    return MapActionButton(
      icon: Icons.location_searching_outlined,
      onPressed: controller.focusCurrentLocation,
    );
  }
}
