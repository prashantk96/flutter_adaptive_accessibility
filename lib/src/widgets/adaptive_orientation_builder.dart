import 'package:flutter/material.dart';

class AdaptiveOrientationBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Orientation orientation) builder;

  const AdaptiveOrientationBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: builder);
  }
}
