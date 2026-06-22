import 'package:flutter/foundation.dart';

/// Global configuration for Flutter Adaptive Accessibility.
///
/// This class controls:
/// - Font scaling behavior
/// - Responsive breakpoints
/// - Accessibility features
///
/// Example:
///
/// ```dart
/// AdaptiveConfig(
///   maxTextScaleFactor: 1.2,
///   tabletBreakpoint: 900,
/// )
/// ```
@immutable
class AdaptiveConfig {
  /// Maximum text scale allowed inside the app.
  ///
  /// Example:
  /// Device font scale = 2.0
  /// App font scale = 1.2
  final double maxTextScaleFactor;

  /// Minimum text scale allowed.
  ///
  /// Useful if you want to prevent text from becoming
  /// too small on certain devices.
  final double minTextScaleFactor;

  /// Width below which the device is considered mobile.
  final double mobileBreakpoint;

  /// Width at which tablet layouts begin.
  final double tabletBreakpoint;

  /// Width at which desktop layouts begin.
  final double desktopBreakpoint;

  /// Enables global font scale protection.
  final bool enableFontScalingGuard;

  /// Enables responsive widgets.
  final bool enableResponsiveLayouts;

  /// Enables accessibility mode detection.
  final bool enableAccessibilityMode;

  const AdaptiveConfig({
    this.maxTextScaleFactor = 1.2,
    this.minTextScaleFactor = 1.0,
    this.mobileBreakpoint = 600,
    this.tabletBreakpoint = 1024,
    this.desktopBreakpoint = 1440,
    this.enableFontScalingGuard = true,
    this.enableResponsiveLayouts = true,
    this.enableAccessibilityMode = true,
  });

  /// Creates a copy with updated values.
  AdaptiveConfig copyWith({
    double? maxTextScaleFactor,
    double? minTextScaleFactor,
    double? mobileBreakpoint,
    double? tabletBreakpoint,
    double? desktopBreakpoint,
    bool? enableFontScalingGuard,
    bool? enableResponsiveLayouts,
    bool? enableAccessibilityMode,
  }) {
    return AdaptiveConfig(
      maxTextScaleFactor: maxTextScaleFactor ?? this.maxTextScaleFactor,
      minTextScaleFactor: minTextScaleFactor ?? this.minTextScaleFactor,
      mobileBreakpoint: mobileBreakpoint ?? this.mobileBreakpoint,
      tabletBreakpoint: tabletBreakpoint ?? this.tabletBreakpoint,
      desktopBreakpoint: desktopBreakpoint ?? this.desktopBreakpoint,
      enableFontScalingGuard:
          enableFontScalingGuard ?? this.enableFontScalingGuard,
      enableResponsiveLayouts:
          enableResponsiveLayouts ?? this.enableResponsiveLayouts,
      enableAccessibilityMode:
          enableAccessibilityMode ?? this.enableAccessibilityMode,
    );
  }
}
