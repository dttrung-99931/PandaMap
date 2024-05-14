// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.size = 20, this.color = Colors.teal, Key? key}) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 1.8,
        ),
      ),
    );
  }
}

class LoadingNotifiierWidget extends StatelessWidget {
  const LoadingNotifiierWidget({
    Key? key,
    required this.child,
    required this.isLoadingNotifier,
  }) : super(key: key);
  final Widget child;
  final ValueNotifier<bool> isLoadingNotifier;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder<bool>(
          valueListenable: isLoadingNotifier,
          builder: (context, isLoading, child) {
            if (isLoading) {
              return Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(color: Colors.black.withOpacity(.05), child: const LoadingWidget()),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
