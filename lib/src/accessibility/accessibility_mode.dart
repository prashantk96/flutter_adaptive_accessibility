import 'package:flutter/material.dart';

/// Indicates whether accessibility mode
/// should be considered active.
///
/// Example:
///
/// ```dart
/// AccessibilityMode(
///   builder: (context, enabled) {
///     return enabled
///         ? AccessibilityView()
///         : NormalView();
///   },
/// )
/// ```
class AccessibilityMode extends StatelessWidget {
  final double threshold;

  final Widget Function(BuildContext context, bool enabled) builder;

  const AccessibilityMode({
    super.key,
    required this.builder,
    this.threshold = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(1);

    final enabled = scale > threshold;

    return builder(context, enabled);
  }
}
