import 'package:flutter/material.dart';
import 'adaptive_config.dart';

/// Central controller used by the package.
///
/// Stores:
/// - Device text scale
/// - Effective text scale
/// - Accessibility state
/// - Breakpoint helpers
class AdaptiveController extends ChangeNotifier {
  AdaptiveController(this._config);

  AdaptiveConfig _config;

  /// Current configuration.
  AdaptiveConfig get config => _config;

  /// Actual text scale from device settings.
  double _deviceTextScale = 1.0;

  double get deviceTextScale => _deviceTextScale;

  /// Returns scale after applying min/max limits.
  double get effectiveTextScale {
    return _deviceTextScale.clamp(
      _config.minTextScaleFactor,
      _config.maxTextScaleFactor,
    );
  }

  /// Returns true when device scale exceeds app limit.
  ///
  /// Example:
  ///
  /// Device Scale = 2.0
  /// Max Allowed = 1.2
  ///
  /// Accessibility Mode = true
  bool get isAccessibilityMode {
    return _deviceTextScale > _config.maxTextScaleFactor;
  }

  /// Updates system text scale.
  void updateTextScale(double scale) {
    _deviceTextScale = scale;
    notifyListeners();
  }

  /// Updates package configuration.
  void updateConfig(AdaptiveConfig config) {
    _config = config;
    notifyListeners();
  }

  /// Returns true if width belongs to mobile layout.
  bool isMobile(double width) {
    return width < _config.mobileBreakpoint;
  }

  /// Returns true if width belongs to tablet layout.
  bool isTablet(double width) {
    return width >= _config.mobileBreakpoint &&
        width < _config.desktopBreakpoint;
  }

  /// Returns true if width belongs to desktop layout.
  bool isDesktop(double width) {
    return width >= _config.desktopBreakpoint;
  }
}
