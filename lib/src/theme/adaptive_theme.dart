import 'package:flutter/material.dart';

class AdaptiveTheme {
  const AdaptiveTheme._();

  static double spacing(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) return 24;
    if (width >= 600) return 20;

    return 16;
  }

  static BorderRadius radius(BuildContext context) {
    return BorderRadius.circular(spacing(context));
  }
}
