import 'package:flutter/widgets.dart';
import 'adaptive_controller.dart';

/// Internal inherited widget used to expose
/// AdaptiveController throughout the widget tree.
///
/// Similar to:
/// - Theme.of(context)
/// - MediaQuery.of(context)
///
/// Usage:
///
/// ```dart
/// final controller =
///     AdaptiveContext.of(context);
/// ```
class AdaptiveContext extends InheritedNotifier<AdaptiveController> {
  const AdaptiveContext({
    super.key,
    required AdaptiveController controller,
    required super.child,
  }) : super(notifier: controller);

  /// Retrieves controller from widget tree.
  static AdaptiveController of(BuildContext context) {
    final AdaptiveContext? result = context
        .dependOnInheritedWidgetOfExactType<AdaptiveContext>();

    assert(result != null, 'AdaptiveApp not found in widget tree.');

    return result!.notifier!;
  }
}
