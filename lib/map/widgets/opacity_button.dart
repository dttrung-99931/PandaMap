import 'package:flutter/material.dart';
class OpacityButton extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final double opacityOnClick;
  final Color colorOnClick;
  final int durationInMilis;
  final bool isEnabled;

  const OpacityButton({
    super.key,
    required this.child,
    this.onTap,
    this.colorOnClick = Colors.transparent,
    this.opacityOnClick = 0.6,
    this.durationInMilis = 100,
    this.isEnabled = true,
  });

  @override
  State<OpacityButton> createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  double _opacity = 1.0;
  Color? _color;

  void setOpacity(double opacity, Color color) {
    if (!mounted || widget.onTap == null) return;
    setState(() {
      _color = color;
      _opacity = opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: widget.durationInMilis),
      opacity: _opacity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: !widget.isEnabled
            ? null
            : (_) {
                setOpacity(widget.opacityOnClick, widget.colorOnClick);
              },
        onTapUp: !widget.isEnabled
            ? null
            : (_) async {
                await Future.delayed(Duration(milliseconds: widget.durationInMilis));
                setOpacity(1.0, Colors.transparent);
              },
        onTap: !widget.isEnabled ? null : widget.onTap,
        // on tap and drag outside
        onTapCancel: !widget.isEnabled
            ? null
            : () async {
                await Future.delayed(Duration(milliseconds: widget.durationInMilis));
                setOpacity(1.0, Colors.transparent);
              },
        child: Container(color: _color, child: widget.child),
      ),
    );
  }
}
