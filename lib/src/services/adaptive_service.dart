import 'package:flutter/material.dart';

import '../models/device_type.dart';
import '../models/screen_info.dart';

class AdaptiveService {
  const AdaptiveService._();

  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return DeviceType.desktop;
    }

    if (width >= 600) {
      return DeviceType.tablet;
    }

    return DeviceType.mobile;
  }

  static ScreenInfo screenInfo(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ScreenInfo(
      width: size.width,
      height: size.height,
      deviceType: getDeviceType(context),
    );
  }
}
