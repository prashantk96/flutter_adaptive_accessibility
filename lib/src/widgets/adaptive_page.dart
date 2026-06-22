import 'package:flutter/material.dart';

class AdaptivePage extends StatelessWidget {
  final Widget child;

  const AdaptivePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    double maxWidth;

    if (width >= 1440) {
      maxWidth = 1200;
    } else if (width >= 1024) {
      maxWidth = 1000;
    } else {
      maxWidth = width;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
