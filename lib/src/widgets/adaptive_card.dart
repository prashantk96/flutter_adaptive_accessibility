import 'package:flutter/material.dart';

/// Smart card widget.
///
/// Automatically adapts padding
/// based on screen size.
///
/// Example:
///
/// ```dart
/// AdaptiveCard(
///   child: ProductDetails(),
/// )
/// ```
class AdaptiveCard extends StatelessWidget {
  final Widget child;

  final EdgeInsets? padding;

  final EdgeInsets? margin;

  final double elevation;

  final Color? color;

  final BorderRadius? borderRadius;

  const AdaptiveCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation = 2,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    EdgeInsets effectivePadding;

    if (padding != null) {
      effectivePadding = padding!;
    } else if (width >= 1200) {
      effectivePadding = const EdgeInsets.all(24);
    } else if (width >= 600) {
      effectivePadding = const EdgeInsets.all(20);
    } else {
      effectivePadding = const EdgeInsets.all(16);
    }

    return Card(
      elevation: elevation,
      color: color,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: Padding(padding: effectivePadding, child: child),
    );
  }
}
