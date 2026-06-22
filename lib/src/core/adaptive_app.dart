import 'package:flutter/material.dart';

import 'adaptive_config.dart';
import 'adaptive_context.dart';
import 'adaptive_controller.dart';

/// Root widget of Flutter Adaptive Accessibility.
///
/// Wrap your application with this widget.
///
/// Example:
///
/// ```dart
/// runApp(
///   AdaptiveApp(
///     config: AdaptiveConfig(
///       maxTextScaleFactor: 1.2,
///     ),
///     child: MyApp(),
///   ),
/// );
/// ```
///
/// Responsibilities:
///
/// ✔ Limit text scaling
/// ✔ Detect accessibility mode
/// ✔ Provide controller globally
/// ✔ Future responsive widgets support
class AdaptiveApp extends StatefulWidget {
  final Widget child;

  final AdaptiveConfig config;

  const AdaptiveApp({
    super.key,
    required this.child,
    this.config = const AdaptiveConfig(),
  });

  @override
  State<AdaptiveApp> createState() => _AdaptiveAppState();
}

class _AdaptiveAppState extends State<AdaptiveApp> {
  late AdaptiveController controller;

  @override
  void initState() {
    super.initState();

    /// Create controller once.
    controller = AdaptiveController(widget.config);
  }

  @override
  void didUpdateWidget(covariant AdaptiveApp oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// Update configuration if changed.
    if (oldWidget.config != widget.config) {
      controller.updateConfig(widget.config);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final mediaQuery = MediaQuery.maybeOf(context);

        /// Safety check.
        if (mediaQuery == null) {
          return widget.child;
        }

        /// Get device text scale.
        final systemScale = mediaQuery.textScaler.scale(1);

        controller.updateTextScale(systemScale);

        /// Apply font scale guard.
        final effectiveScale = widget.config.enableFontScalingGuard
            ? controller.effectiveTextScale
            : systemScale;

        return AdaptiveContext(
          controller: controller,
          child: MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: TextScaler.linear(effectiveScale),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
