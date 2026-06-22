import 'package:flutter/material.dart';

class AdaptiveVisibility extends StatelessWidget {
  final Widget child;

  final bool mobile;

  final bool tablet;

  final bool desktop;

  const AdaptiveVisibility({
    super.key,
    required this.child,
    this.mobile = true,
    this.tablet = true,
    this.desktop = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < 600 && !mobile) {
      return const SizedBox.shrink();
    }

    if (width >= 600 && width < 1200 && !tablet) {
      return const SizedBox.shrink();
    }

    if (width >= 1200 && !desktop) {
      return const SizedBox.shrink();
    }

    return child;
  }
}
