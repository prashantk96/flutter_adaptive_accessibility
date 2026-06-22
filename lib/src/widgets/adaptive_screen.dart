import 'package:flutter/material.dart';

/// Displays different widgets
/// based on screen size.
///
/// Example:
///
/// ```dart
/// AdaptiveScreen(
///   mobile: MobileHome(),
///   tablet: TabletHome(),
///   desktop: DesktopHome(),
/// )
/// ```
class AdaptiveScreen extends StatelessWidget {
  final Widget mobile;

  final Widget? tablet;

  final Widget? desktop;

  const AdaptiveScreen({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200 && desktop != null) {
      return desktop!;
    }

    if (width >= 600 && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
