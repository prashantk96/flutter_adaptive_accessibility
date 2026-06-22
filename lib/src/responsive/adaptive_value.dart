import 'package:flutter/material.dart';

class AdaptiveValue<T> {
  final T mobile;
  final T? tablet;
  final T? desktop;

  const AdaptiveValue({required this.mobile, this.tablet, this.desktop});

  T resolve(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return desktop ?? tablet ?? mobile;
    }

    if (width >= 600) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}
