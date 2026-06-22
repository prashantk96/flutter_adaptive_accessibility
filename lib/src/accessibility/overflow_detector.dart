import 'package:flutter/material.dart';

/// Detects when content is likely to overflow.
///
/// Useful for:
/// - Accessibility mode
/// - Large font sizes
/// - Small devices
///
/// Example:
///
/// ```dart
/// OverflowDetector(
///   builder: (context, isOverflowing) {
///     return isOverflowing
///         ? Column(...)
///         : Row(...);
///   },
/// )
/// ```
class OverflowDetector extends StatelessWidget {
  final double minWidth;

  final Widget Function(BuildContext context, bool isOverflowing) builder;

  const OverflowDetector({
    super.key,
    required this.builder,
    this.minWidth = 400,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isOverflowing = constraints.maxWidth < minWidth;

        return builder(context, isOverflowing);
      },
    );
  }
}
