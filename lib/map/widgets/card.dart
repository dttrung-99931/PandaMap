import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsets padding;
  final BoxShape shape;

  const AppCard({
    Key? key,
    required this.child,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(12),
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: shape != BoxShape.circle ? BorderRadius.circular(16) : null,
        color: Colors.white,
        boxShadow: [BoxShadow(offset: Offset(-elevation, elevation), color: Colors.black.withOpacity(0.04))],
      ),
      child: child,
    );
  }
}
