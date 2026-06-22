import 'package:flutter/material.dart';

/// Gives responsive information
/// without repeatedly writing MediaQuery.
///
/// Example:
///
/// ```dart
/// AdaptiveBuilder(
///   builder: (context, info) {
///     if (info.isMobile) {
///       return MobileView();
///     }
///
///     return TabletView();
///   },
/// )
/// ```
class AdaptiveInfo {
  final double width;
  final double height;

  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  const AdaptiveInfo({
    required this.width,
    required this.height,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
  });
}

class AdaptiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AdaptiveInfo info) builder;

  const AdaptiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final width = size.width;

    final info = AdaptiveInfo(
      width: width,
      height: size.height,
      isMobile: width < 600,
      isTablet: width >= 600 && width < 1200,
      isDesktop: width >= 1200,
    );

    return builder(context, info);
  }
}
