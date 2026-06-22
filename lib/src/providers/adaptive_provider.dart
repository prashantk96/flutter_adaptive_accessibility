import 'package:flutter/widgets.dart';

class AdaptiveProvider extends InheritedWidget {
  final bool accessibilityMode;

  const AdaptiveProvider({
    super.key,
    required this.accessibilityMode,
    required super.child,
  });

  static AdaptiveProvider of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<AdaptiveProvider>();

    assert(provider != null);

    return provider!;
  }

  @override
  bool updateShouldNotify(AdaptiveProvider oldWidget) {
    return accessibilityMode != oldWidget.accessibilityMode;
  }
}
