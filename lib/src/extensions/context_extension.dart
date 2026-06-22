import 'package:flutter/material.dart';

import '../models/device_type.dart';
import '../services/adaptive_service.dart';

extension AdaptiveContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => AdaptiveService.getDeviceType(this) == DeviceType.mobile;

  bool get isTablet => AdaptiveService.getDeviceType(this) == DeviceType.tablet;

  bool get isDesktop =>
      AdaptiveService.getDeviceType(this) == DeviceType.desktop;

  double get textScale => MediaQuery.textScalerOf(this).scale(1);
}
