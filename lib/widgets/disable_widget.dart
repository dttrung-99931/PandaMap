// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DisableWidget extends StatelessWidget {
  const DisableWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.35,

      /// Change text color of [child] to black
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.saturation),
        child: AbsorbPointer(
          child: child,
        ),
      ),
    );
  }
}
