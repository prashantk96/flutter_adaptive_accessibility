import 'package:flutter/material.dart';

class AdaptiveTypography {
  const AdaptiveTypography._();

  static TextStyle headline(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
    }

    if (width >= 600) {
      return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    }

    return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }

  static TextStyle body(BuildContext context) {
    return const TextStyle(fontSize: 16);
  }
}
