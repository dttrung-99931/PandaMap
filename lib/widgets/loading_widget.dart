// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.size = 20,
    this.color = Colors.teal,
    super.key,
    this.center = true,
  });

  final double? size;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    var loading = SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
    return center
        ? Center(
            child: loading,
          )
        : loading;
  }
}

class LoadingListener extends StatelessWidget {
  const LoadingListener({
    super.key,
    required this.child,
    required this.isLoadingNotifier,
  });
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
                  child: Container(
                      color: Colors.black.withOpacity(.05),
                      child: const LoadingWidget()),
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
