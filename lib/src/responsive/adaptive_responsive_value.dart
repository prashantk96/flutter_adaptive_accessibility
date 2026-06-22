import 'package:flutter/material.dart';

class AdaptiveResponsiveValue<T> {
  final T mobile;
  final T tablet;
  final T desktop;

  const AdaptiveResponsiveValue({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  T resolve(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return desktop;
    }

    if (width >= 600) {
      return tablet;
    }

    return mobile;
  }
}
