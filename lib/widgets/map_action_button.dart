// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panda_map/widgets/card_icon.dart';
import 'package:panda_map/widgets/opacity_button.dart';

class MapActionButton extends StatelessWidget {
  const MapActionButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isVisible = true,
  }) : super(key: key);
  final Function() onPressed;
  final IconData icon;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onTap: onPressed,
      child: isVisible ? CardIcon(
        icon,
        size: 24,
        padding: const EdgeInsets.all(8),
      ) : const SizedBox.shrink(),
    );
  }
}
