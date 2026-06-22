import 'package:flutter/material.dart';

class AdaptiveSpacing extends StatelessWidget {
  final double mobile;

  final double tablet;

  final double desktop;

  const AdaptiveSpacing({
    super.key,
    this.mobile = 8,
    this.tablet = 16,
    this.desktop = 24,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    double size;

    if (width >= 1200) {
      size = desktop;
    } else if (width >= 600) {
      size = tablet;
    } else {
      size = mobile;
    }

    return SizedBox(height: size, width: size);
  }
}
