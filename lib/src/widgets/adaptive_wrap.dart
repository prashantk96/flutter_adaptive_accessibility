import 'package:flutter/material.dart';

/// Intelligent Wrap widget.
///
/// Useful for:
///
/// - Chips
/// - Tags
/// - Category buttons
/// - Filters
///
/// Automatically moves items
/// to next line when space is insufficient.
class AdaptiveWrap extends StatelessWidget {
  final List<Widget> children;

  final double spacing;

  final double runSpacing;

  final WrapAlignment alignment;

  const AdaptiveWrap({
    super.key,
    required this.children,
    this.spacing = 8,
    this.runSpacing = 8,
    this.alignment = WrapAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      children: children,
    );
  }
}
