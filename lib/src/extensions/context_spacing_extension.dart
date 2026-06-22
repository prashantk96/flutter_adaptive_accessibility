import 'package:flutter/material.dart';

extension AdaptiveSpacingExtension on BuildContext {
  double get adaptiveSpacing {
    final width = MediaQuery.sizeOf(this).width;

    if (width >= 1200) {
      return 24;
    }

    if (width >= 600) {
      return 20;
    }

    return 16;
  }
}
