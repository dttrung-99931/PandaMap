// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.size = 20,
    this.color = Colors.teal,
    Key? key,
    this.center = true,
  }) : super(key: key);

  final double? size;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    var loading = SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
      // TODO: Use spin kit fading
      // child: SpinKitFadingCircle(
      //   size: size,
      //   itemBuilder: (BuildContext context, int index) {
      //     return DecoratedBox(
      //       decoration: BoxDecoration(
      //         color: color,
      //       ),
      //     );
      //   },
      // ),
    );
    return center
        ? Center(
            child: loading,
          )
        : loading;
  }
}

class LoadingListenerWidget extends StatelessWidget {
  const LoadingListenerWidget({
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
