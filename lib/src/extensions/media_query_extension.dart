import 'package:flutter/material.dart';

extension AdaptiveMediaQueryExtension on MediaQueryData {
  bool get isLandscape => size.width > size.height;

  bool get isPortrait => size.height > size.width;
}
