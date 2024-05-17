import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final bool isSliver;

  const NotFound({
    super.key,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    var widget = Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: const Text('Không tìm thấy!'),
    );
    return isSliver ? SliverFillRemaining(child: widget) : widget;
  }
}
