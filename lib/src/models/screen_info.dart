import 'device_type.dart';

class ScreenInfo {
  final double width;
  final double height;
  final DeviceType deviceType;

  const ScreenInfo({
    required this.width,
    required this.height,
    required this.deviceType,
  });

  bool get isMobile => deviceType == DeviceType.mobile;

  bool get isTablet => deviceType == DeviceType.tablet;

  bool get isDesktop => deviceType == DeviceType.desktop;
}
