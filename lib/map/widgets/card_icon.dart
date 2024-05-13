import 'package:flutter/material.dart';
import 'card.dart';

class CardIcon extends StatelessWidget {
  const CardIcon(
    this.iconData, {
    this.padding = const EdgeInsets.all(8),
    this.size,
    Key? key,
  }) : super(key: key);
  final IconData iconData;
  final EdgeInsets padding;
  final double? size;

  factory CardIcon.smallPadding(IconData iconData, {double? size}) {
    return CardIcon(
      iconData,
      padding: EdgeInsets.zero,
      size: size,
    );
  }

  factory CardIcon.zeroPadding(IconData iconData, {double? size}) {
    return CardIcon(
      iconData,
      padding: EdgeInsets.zero,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 2,
      padding: padding,
      shape: BoxShape.circle,
      child: Icon(iconData, size: size),
    );
  }
}
