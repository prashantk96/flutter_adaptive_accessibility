import 'package:flutter/material.dart';

/// Protects widget subtree
/// from excessive font scaling.
///
/// Example:
///
/// ```dart
/// FontScaleGuard(
///   maxScale: 1.2,
///   child: MyWidget(),
/// )
/// ```
class FontScaleGuard extends StatelessWidget {
  final Widget child;

  final double maxScale;

  final double minScale;

  const FontScaleGuard({
    super.key,
    required this.child,
    this.maxScale = 1.2,
    this.minScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final scale = mediaQuery.textScaler.scale(1);

    final effectiveScale = scale.clamp(minScale, maxScale);

    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: TextScaler.linear(effectiveScale)),
      child: child,
    );
  }
}
