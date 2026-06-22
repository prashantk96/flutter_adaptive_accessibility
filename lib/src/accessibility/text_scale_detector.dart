import 'package:flutter/material.dart';

/// Detects current text scaling.
///
/// Example:
///
/// ```dart
/// TextScaleDetector(
///   builder: (context, scale) {
///     return Text('$scale');
///   },
/// )
/// ```
class TextScaleDetector extends StatelessWidget {
  final Widget Function(BuildContext context, double textScale) builder;

  const TextScaleDetector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(1);

    return builder(context, scale);
  }
}
